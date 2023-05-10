local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
	return
end

toggleterm.setup({
	open_mapping = [[<a-t>]], -- use alt+t to toggle the terminal
	direction = "float",
	float_opts = {
		border = "curved",
	},
})
