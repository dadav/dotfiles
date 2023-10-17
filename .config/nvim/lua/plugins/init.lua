return {
  { import = "plugins.ui" },
  { import = "plugins.languages" },
  { import = "plugins.utils" },
  { import = "plugins.lsp" },
  { import = "plugins.cmp" },
  {
    "local/schreibmaschine",
    dev = true,
    config = true,
    enabled = true,
    opts = {},
  },
}
