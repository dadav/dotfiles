local ok, _ = pcall(require, "vim-visual-multi")
if not ok then
	return
end

vim.g.VM_theme = "nord"
