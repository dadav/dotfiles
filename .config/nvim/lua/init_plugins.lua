local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Looks & Feels
  -- Best colorscheme
  { "josuegaleas/jay", lazy = false },
  { "catppuccin/nvim", name = "catppuccin" },
  "easymotion/vim-easymotion",
  "yuttie/comfortable-motion.vim",
  "mg979/vim-visual-multi",

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },

  -- vim.g.barbar_auto_setup = false
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",     -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  "nvim-treesitter/nvim-treesitter-context",

  "nvim-treesitter/nvim-treesitter-textobjects",

  -- Textobject selector
  "gcmt/wildfire.vim",

  -- Highlight word under cursor
  "RRethy/vim-illuminate",

  -- Show indention
  "lukas-reineke/indent-blankline.nvim",

  -- Show whitespaces
  "ntpeters/vim-better-whitespace",

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    build = "make install_jsregexp",
  },
  "rafamadriz/friendly-snippets",
  "honza/vim-snippets",

  -- Autocompletion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "FelipeLema/cmp-async-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "saadparwaiz1/cmp_luasnip",

  -- Search & Replace
  "wincent/scalpel",

  -- Alignment
  "junegunn/vim-easy-align",

  -- LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  "neovim/nvim-lspconfig",
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup({})
    end,
  },

  -- Formatting and linting
  "jose-elias-alvarez/null-ls.nvim",
  "folke/lsp-colors.nvim", -- add LSP colors for colorschemes that don't yet support them
  "b0o/schemastore.nvim",

  -- Tpope plugins
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-endwise",
  "tpope/vim-speeddating",
  "tpope/vim-eunuch",

  -- Show me mappings
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end,
  },
  -- Automatically create pairwise brackets
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Easily create comments
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Fuzzy finder for lists
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end,
  },

  -- Fileexplorer written in lua
  -- {
  --   "kyazdani42/nvim-tree.lua",
  --   dependencies = { { "kyazdani42/nvim-web-devicons" } },
  -- },

  -- Beautiful notification messages
  "rcarriga/nvim-notify",

  -- Git
  {
    "lewis6991/gitsigns.nvim",
  },
  { "sindrets/diffview.nvim" },

  -- Terminal
  { "akinsho/toggleterm.nvim", version = "*" },

})
