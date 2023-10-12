return {
  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Harden, then check
        sh = { "shfmt", "shellharden", "shellcheck" },
      },
    },
  },
  -- Diagnostics
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        sh = { "shellcheck" },
      },
    },
  },
  -- Install additional tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "shfmt",
        "shellcheck",
        "shellharden",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      -- delve is for go
      ensure_installed = { "bash" },
    },
  },
}
