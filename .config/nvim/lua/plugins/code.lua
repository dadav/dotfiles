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
}
