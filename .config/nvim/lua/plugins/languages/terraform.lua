vim.filetype.add({
  extension = {
    tf = "terraform",
  },
})
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {
          single_file_support = true,
        },
      },
    },
  },
}
