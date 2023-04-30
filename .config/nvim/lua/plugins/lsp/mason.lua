-- protected calls
local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

local default_servers = {
	"tsserver",
	"cssmodules_ls",
	"emmet_ls",
	"html",
	"solargraph",
	"ansiblels",
	"ruff_lsp",
	"lua_ls",
	"helm_ls",
	"gopls",
	"ruff_lsp",
	"rust_analyzer",
	"yamlls",
}

-- Here we declare which settings to pass to the mason, and also ensure servers are installed. If not, they will be installed automatically.
local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "(+)",
			package_pending = "(~)",
			package_uninstalled = "(-)",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = default_servers,
	automatic_installation = true,
})

-- we'll need to call lspconfig to pass our server to the native neovim lspconfig.
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

for _, server in pairs(mason_lspconfig.get_installed_servers()) do
	local opts = {
		on_attach = require("plugins.lsp.handlers").on_attach,
		capabilities = require("plugins.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
