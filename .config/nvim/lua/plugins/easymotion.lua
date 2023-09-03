-- Disable default mapping
vim.g.EasyMotion_do_mapping = 0

local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>j", "<Plug>(easymotion-overwin-f)", { desc = "[j]ump", noremap = true, silent = false })
