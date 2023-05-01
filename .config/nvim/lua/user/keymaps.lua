local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal, Visual, Operator-pending
-- Treat long lines as break lines
keymap("", "j", "gj", opts)
keymap("", "k", "gk", opts)

-- Normal --
-- Remove highlight
keymap("n", "<BS>", ":nohlsearch<CR>", opts)

-- Show hidden characters (toggle)
keymap("n", "<leader>lt", ":set list!<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Command --
-- Use sudo to save the file
keymap("c", "w!!", "w !sudo tee > /dev/null %", { noremap = true })
