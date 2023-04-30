local ok, notify = pcall(require, "notify")
if not ok then
	return
end

-- Enable beautiful color support
vim.opt.termguicolors = true

notify.setup()

-- Make it the default notification service
vim.notify = notify
