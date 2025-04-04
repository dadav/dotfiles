vim.filetype.add({ extension = { mdx = "mdx" } })
vim.treesitter.language.register("javascript", "mdx")

return {
  -- Diagnostics
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        mdx_analyzer = {},
      },
    },
  },
  -- Install additional tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "mdx-analyzer",
      })
    end,
  },
}
