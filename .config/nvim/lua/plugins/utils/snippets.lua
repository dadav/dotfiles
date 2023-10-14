return {
  -- Put custom snippets to ~/.config/nvim/snippets/$ft.snippets
  -- Example: https://raw.githubusercontent.com/honza/vim-snippets/master/snippets/sh.snippets
  {
    "L3MON4D3/LuaSnip",
    config = function(_, opts)
      require("luasnip").setup(opts)
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
  },
}
