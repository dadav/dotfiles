return {
  -- Lightweight yet powerful formatter plugin for Neovim
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format" },
      },
    },
  },
  -- pyright -> ruff
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff_lsp = {},
        pyright = {
          mason = false,
          autostart = false,
        },
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
