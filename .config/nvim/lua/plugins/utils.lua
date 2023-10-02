return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<a-t>", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm" },
    },
    opts = {
      open_mapping = [[<a-t>]],
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
  },
}
