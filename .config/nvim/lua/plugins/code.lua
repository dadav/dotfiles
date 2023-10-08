return {
  -- Lightweight yet powerful formatter plugin for Neovim
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Harden, then check
        sh = { "shfmt", "shellharden", "shellcheck" },
        -- Ruff is the best
        python = { "ruff_fix", "ruff_format" },
        -- Run on every file
        ["*"] = { "trim_whitespace", "trim_newlines" },
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
  -- Autocompletion for kubernetes
  {
    "someone-stole-my-name/yaml-companion.nvim",
    ft = { "yaml" },
    opts = {
      builtin_matchers = {
        kubernetes = { enabled = true },
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
    end,
  },
}
