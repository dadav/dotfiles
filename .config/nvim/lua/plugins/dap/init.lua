local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end
local dapui = require("dapui")
dapui.setup()

require("nvim-dap-virtual-text").setup()

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- set some default keymaps
vim.keymap.set("n", "<leader>dk", function()
	dap.continue()
end)
vim.keymap.set("n", "<leader>dl", function()
	dap.run_last()
end)
vim.keymap.set("n", "<leader>b", function()
	dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
