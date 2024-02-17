return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    opts = {
      default_mappings = {
        ours = "<leader>gxo",
        theirs = "<leader>gxt",
        none = "<leader>gx0",
        both = "<leader>gxb",
        next = "<leader>gxn",
        prev = "<leader>gxp",
      },
    },
  },
}
