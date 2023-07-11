local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

-- Bootstrap packet itself
local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_config_changed
    autocmd!
    autocmd BufWritePost init_plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Plugin-Manager
	use("wbthomason/packer.nvim")

	-- Looks & Feels
	-- Best colorscheme
	use("josuegaleas/jay")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("easymotion/vim-easymotion")
	use("yuttie/comfortable-motion.vim")
	use("mg979/vim-visual-multi")

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	})

	vim.g.barbar_auto_setup = false
	use({
		"romgrk/barbar.nvim",
		requires = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
	})

	-- Syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("nvim-treesitter/nvim-treesitter-context")

	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- Highlight word under cursor
	use("RRethy/vim-illuminate")

	-- Show indention
	use("lukas-reineke/indent-blankline.nvim")

	-- Show whitespaces
	use("ntpeters/vim-better-whitespace")

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
	})
	use("rafamadriz/friendly-snippets")
	use("honza/vim-snippets")

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("FelipeLema/cmp-async-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("saadparwaiz1/cmp_luasnip")

	-- Search & Replace
	use("wincent/scalpel")

	-- Alignment
	use("junegunn/vim-easy-align")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use({
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			require("fidget").setup({})
		end,
	})

	-- Formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("folke/trouble.nvim") -- Nice overview of errors/warnings coming from e.g. LSP
	use("folke/lsp-colors.nvim") -- add LSP colors for colorschemes that don't yet support them
	use("b0o/schemastore.nvim")

	-- DAP
	-- use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	-- use({ "theHamsta/nvim-dap-virtual-text", requires = { "mfussenegger/nvim-dap" } })
	-- use("leoluz/nvim-dap-go") -- requires delve
	-- use("mfussenegger/nvim-dap-python") -- requires debugpy https://github.com/microsoft/debugpy

	-- Tpope plugins
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("tpope/vim-endwise")
	use("tpope/vim-speeddating")
	use("tpope/vim-eunuch")

	-- Show me mappings
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup()
		end,
	})
	-- Automatically create pairwise brackets
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	-- Easily create comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Fuzzy finder for lists
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-dap.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	-- Fileexplorer written in lua
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { { "kyazdani42/nvim-web-devicons" } },
	})

	-- Beautiful notification messages
	use("rcarriga/nvim-notify")

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
	})

	-- Terminal
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
