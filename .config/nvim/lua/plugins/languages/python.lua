return {
  -- Install additional tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ruff",
      })
    end,
  },
  -- Lightweight yet powerful formatter plugin for Neovim
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format" },
      },
    },
  },
  -- DAP
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "python",
      })
    end,
  },
}
