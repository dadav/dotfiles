return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "puppet" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "puppet" })
      end
    end,
  },
  -- only works with ruby 2.7, not 3+
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        puppet = {},
      },
    },
  },
}
