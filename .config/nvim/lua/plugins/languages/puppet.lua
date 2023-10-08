return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "puppet" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "puppet",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        puppet = {},
      },
    },
  },
}
