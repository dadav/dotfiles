local wk = require("which-key")

wk.add({ "<leader>y", group = "Yaml" })

-- yamlls resolves every schema over HTTP: LazyVim's yaml extra feeds it
-- SchemaStore.nvim's https URLs, and yaml-companion's kubernetes/cloud_init
-- matchers point at raw.githubusercontent.com. The offline docker image
-- (dadav/lazyvim-offline-docker) mirrors all of those to disk and exports
-- YAML_SCHEMA_DIR; when that directory exists everything is served from there.
local schema_dir = vim.env.YAML_SCHEMA_DIR
local offline = schema_dir ~= nil and schema_dir ~= "" and vim.uv.fs_stat(schema_dir) ~= nil

local function read_json(path)
  local handle = io.open(path, "r")
  if not handle then
    return nil
  end
  local content = handle:read("*a")
  handle:close()
  local ok, decoded = pcall(vim.json.decode, content)
  if not ok then
    return nil
  end
  return decoded
end

-- Replaces a builtin yaml-companion matcher with one that keeps the builtin's
-- buffer detection but returns a schema pointing at the local mirror. Matchers
-- are resolved as `yaml-companion._matchers.<name>`, so registering them in
-- package.preload is enough (see yaml-companion/_matchers/init.lua).
local function register_offline_matcher(name, builtin_module, display_name, uri)
  package.preload["yaml-companion._matchers." .. name] = function()
    local schema = { name = display_name, uri = uri }
    return {
      match = function(bufnr)
        if require(builtin_module).match(bufnr) then
          return schema
        end
      end,
      handles = function()
        return { schema }
      end,
    }
  end
end

local builtin_matchers = {
  kubernetes = { enabled = true },
  cloud_init = { enabled = true },
}
local companion_schemas = {}

if offline then
  register_offline_matcher(
    "kubernetes_offline",
    "yaml-companion.builtin.kubernetes",
    "Kubernetes",
    "file://" .. schema_dir .. "/k8s/all.json"
  )
  register_offline_matcher(
    "cloud_init_offline",
    "yaml-companion.builtin.cloud_init",
    "cloud-init",
    "file://" .. schema_dir .. "/cloudinit/root.json"
  )
  builtin_matchers = {
    kubernetes = { enabled = false },
    cloud_init = { enabled = false },
    kubernetes_offline = { enabled = true },
    cloud_init_offline = { enabled = true },
  }
  -- keeps every mirrored schema listed in the <leader>ys picker
  companion_schemas = read_json(schema_dir .. "/catalog.json") or {}
end

return {
  -- Autocompletion for kubernetes
  {
    "someone-stole-my-name/yaml-companion.nvim",
    ft = { "yaml" },
    opts = {
      log_level = "info",
      formatting = true,
      builtin_matchers = builtin_matchers,
      schemas = companion_schemas,
      lspconfig = {
        flags = {
          debounce_text_changes = 150,
        },
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            validate = true,
            format = { enable = true },
            hover = true,
            schemaStore = {
              enable = not offline,
              url = offline and "" or "https://www.schemastore.org/api/json/catalog.json",
            },
            schemaDownload = { enable = not offline },
            schemas = {},
            trace = { server = "debug" },
          },
        },
      },
    },
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function(_, opts)
      local cfg = require("yaml-companion").setup(opts)
      -- yaml-companion's defaults seed yaml.schemas with a legacy `result` key;
      -- it is not a schema URI, so keep it out of what is sent to yamlls.
      cfg.settings.yaml.schemas.result = nil
      require("lspconfig")["yamlls"].setup(cfg)

      -- LazyVim configures yamlls too and its config wins, so the on_attach and
      -- on_init hooks yaml-companion installs through lspconfig do not reliably
      -- reach every buffer or client. Without a per-buffer context the
      -- kubernetes and cloud_init matchers never run, so wire it up explicitly.
      -- helm and non-file buffers are skipped: yaml-companion detaches yamlls
      -- from those via vim.diagnostic.disable(), removed in nvim 0.12.
      local notified = {}
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("yaml_companion_context", { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client or client.name ~= "yamlls" then
            return
          end
          if vim.bo[args.buf].buftype ~= "" or vim.bo[args.buf].filetype == "helm" then
            return
          end
          -- yaml-companion pushes a schema override with the pre-0.11
          -- client.workspace_did_change_configuration(), gone in nvim 0.12.
          if not client.workspace_did_change_configuration then
            client.workspace_did_change_configuration = function(settings)
              client:notify("workspace/didChangeConfiguration", { settings = settings or client.settings })
            end
          end

          local ctx = require("yaml-companion.context")
          if not notified[client.id] then
            notified[client.id] = true
            client.notify("yaml/supportSchemaSelection", { {} })
          end
          -- yamlls has finished initializing by the time it attaches, so schema
          -- requests are safe; yaml-companion otherwise only learns this from a
          -- notification whose handler runs before later buffers exist.
          ctx.initialized_client_ids[client.id] = true
          if ctx.ctxs[args.buf] == nil then
            ctx.setup(args.buf, client)
          end
        end,
      })

      require("telescope").load_extension("yaml_schema")
      vim.keymap.set("n", "<leader>ys", require("yaml-companion").open_ui_select, { desc = "Select schema" })
    end,
  },
  -- Filename-based schema associations. LazyVim's yaml extra fills these from
  -- SchemaStore.nvim (https URLs) in its own before_init; offline we replace
  -- that hook with the mirrored catalog, which uses file:// URLs.
  {
    "neovim/nvim-lspconfig",
    opts = offline and {
      servers = {
        yamlls = {
          before_init = function(_, new_config)
            new_config.settings.yaml.schemas = read_json(schema_dir .. "/schemas.json") or {}
          end,
        },
      },
    } or {},
  },
  -- Diagnostics
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        yaml = { "yamllint" },
      },
    },
  },
  -- Install additional tools
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "yamllint",
        "yamlfix",
      })
    end,
  },
  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        yaml = { "yamlfix" },
      },
      formatters = {
        yamlfix = {
          env = {
            YAMLFIX_SEQUENCE_STYLE = "block_style",
            YAMLFIX_WHITELINES = "1",
            YAMLFIX_LINE_LENGTH = "120",
          },
        },
      },
    },
  },
}
