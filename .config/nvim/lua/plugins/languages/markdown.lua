return {
  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = { "prettierd" },
      },
    },
  },
  -- Diagnostics
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      { "williamboman/mason.nvim" },
    },
    opts = function(_, opts)
      if type(opts.sources) == "table" then
        local nls = require("null-ls")
        vim.list_extend(opts.sources, {
          nls.builtins.diagnostics.markdownlint,
        })
      end
    end,
  },
  -- Install additional tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "markdownlint",
      },
    },
  },
}
