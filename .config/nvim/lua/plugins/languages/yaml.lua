local wk = require("which-key")

wk.add({ "<leader>y", group = "Yaml" })

return {
  -- Autocompletion for kubernetes
  {
    "someone-stole-my-name/yaml-companion.nvim",
    ft = { "yaml" },
    opts = {
      log_level = "info",
      formatting = true,
      builtin_matchers = {
        kubernetes = { enabled = true },
        cloud_init = { enabled = true },
      },
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
              enable = true,
              url = "https://www.schemastore.org/api/json/catalog.json",
            },
            schemaDownload = { enable = true },
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
      require("lspconfig")["yamlls"].setup(cfg)
      require("telescope").load_extension("yaml_schema")
      vim.keymap.set("n", "<leader>ys", require("yaml-companion").open_ui_select, { desc = "Select schema" })
    end,
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
    "williamboman/mason.nvim",
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
