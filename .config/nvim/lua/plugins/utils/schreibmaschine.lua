return {
  {
    "dadav/schreibmaschine.nvim",
    version = false,
    lazy = false,
    init = function()
      vim.keymap.set("n", "<leader>Tt", "<cmd>SchreibmaschineToggle<cr>")
      vim.keymap.set("n", "<leader>Tp", "<cmd>SchreibmaschineProfilePicker<cr>")
    end,
    opts = {},
  },
}
