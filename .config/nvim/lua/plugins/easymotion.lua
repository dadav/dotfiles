-- Disable default mapping
vim.g.EasyMotion_do_mapping = 0

local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>jj", "<Plug>(easymotion-overwin-f)", {})
