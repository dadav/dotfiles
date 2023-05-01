local ok, _ = pcall(require, "barbar")
if not ok then
	return
end

require("barbar").setup({
	-- Mouse is for noobs
	clickable = false,
	-- Dont need tabs on single files
	auto_hide = true,
	-- Title for buffers
	no_name_title = "UNSAVED",
})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<A-p>", "<Cmd>BufferPrevious<CR>", opts)
keymap("n", "<A-n>", "<Cmd>BufferNext<CR>", opts)
keymap("n", "<A-w>", "<Cmd>BufferClose<CR>", opts)
keymap("n", "<A-s>", "<Cmd>BufferPick<CR>", opts)
