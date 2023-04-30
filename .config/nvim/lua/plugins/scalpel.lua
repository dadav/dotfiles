-- Disable default mappings
vim.g.ScalpelMap = 0

-- Bind to <leader>r
vim.api.nvim_set_keymap("n", "<leader>r", "<Plug>(Scalpel)", {})
