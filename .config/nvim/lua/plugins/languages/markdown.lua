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
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint" },
      },
    },
  },
  -- Install additional tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "markdownlint",
      })
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    enabled = false,
  },
}
