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

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- leap.nvim
local status_ok_leap, _ = pcall(require, "leap")
if status_ok_leap then
	keymap("n", "<leader>j", "<Plug>(leap-forward-to)", { noremap = false, silent = true })
end

-- scalpel
local status_ok_scalpel, _ = pcall(require, "scalpel")
if status_ok_scalpel then
	keymap("n", "<leader>r", "<Plug>(Scalpel)", { noremap = false, silent = true })
end
