return {
  -- Lightweight yet powerful formatter plugin for Neovim
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Harden, then check
        sh = { "shellharden", "shellcheck" },
        -- Ruff is the best
        python = { "ruff_fix", "ruff_format" },
        -- Run on every file
        ["*"] = { "trim_whitespaces", "trim_newlines" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
  -- Enable the line blame functionality
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
  -- {
  --   "someone-stole-my-name/yaml-companion.nvim",
  --   opts = {
  --     builtin_matchers = {
  --       kubernetes = { enabled = true },
  --     },
  --     lspconfig = {
  --       flags = {
  --         debounce_text_changes = 150,
  --       },
  --       settings = {
  --         redhat = { telemetry = { enabled = false } },
  --         yaml = {
  --           validate = true,
  --           format = { enable = false },
  --           hover = true,
  --           schemaStore = {
  --             enable = true,
  --             url = "https://www.schemastore.org/api/json/catalog.json",
  --           },
  --           schemaDownload = { enable = true },
  --           schemas = {},
  --           trace = { server = "debug" },
  --         },
  --       },
  --     },
  --   },
  --   config = function()
  --     require("telescope").load_extension("yaml_schema")
  --   end,
  -- },
}
