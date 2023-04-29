local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

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

-- Normal --
-- Better window navigation
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- Allow switching windows from any mode
keymap("t", "<A-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<A-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<A-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<A-l>", "<C-\\><C-N><C-w>l", term_opts)
keymap("i", "<A-h>", "<C-\\><C-N><C-w>h", opts)
keymap("i", "<A-j>", "<C-\\><C-N><C-w>j", opts)
keymap("i", "<A-k>", "<C-\\><C-N><C-w>k", opts)
keymap("i", "<A-l>", "<C-\\><C-N><C-w>l", opts)
keymap("v", "<A-h>", "<C-\\><C-N><C-w>h", opts)
keymap("v", "<A-j>", "<C-\\><C-N><C-w>j", opts)
keymap("v", "<A-k>", "<C-\\><C-N><C-w>k", opts)
keymap("v", "<A-l>", "<C-\\><C-N><C-w>l", opts)

-- Make it easier to get out of terminal mode
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)
keymap("t", "<M-[>", "<Esc>", term_opts)
keymap("t", "<C-v><Esc>", "<Esc>", term_opts)
keymap("t", "<Leader><Esc>", "<Esc>", term_opts)

-- Enable pasting in terminal insert mode trhough ALT+r + Register
vim.cmd([[tnoremap <expr><A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi']])

-- leap.nvim default keybindings: https://github.com/ggandor/leap.nvim#usage
local status_ok, leap = pcall(require, "leap")
if not status_ok then
	return
end
leap.add_default_mappings()
