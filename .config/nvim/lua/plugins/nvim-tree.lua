local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	vim.keymap.set("n", "<BS>", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
	vim.keymap.set("n", "a", api.fs.create, opts("Create"))
	vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
	vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
	vim.keymap.set("n", "\\", api.live_filter.clear, opts("Clean Filter"))
	vim.keymap.set("n", "/", api.live_filter.start, opts("Filter"))
	vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
	vim.keymap.set("n", "y", api.fs.copy.node, opts("Copy"))
	vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
	vim.keymap.set("n", "q", api.tree.close, opts("Close"))
	vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
	vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
	vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
	vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
	vim.keymap.set("n", "h", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
end

nvim_tree.setup({
	on_attach = on_attach,
	sort_by = "case_sensitive",
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

vim.api.nvim_set_keymap("n", "<leader><tab>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
