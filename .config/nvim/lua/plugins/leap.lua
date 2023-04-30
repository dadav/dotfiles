local ok, _ = pcall(require, "leap")
if not ok then
	return
end

local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>j", "<Plug>(leap-forward-to)", {})
keymap("n", "<leader><S-j>", "<Plug>(leap-backward-to)", {})
