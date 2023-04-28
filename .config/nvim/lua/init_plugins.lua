local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
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
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

return packer.startup(function(use)
  -- Plugin-Manager
  use 'wbthomason/packer.nvim'

  -- Cache all the things
  -- Should be on top
  use {
    'lewis6991/impatient.nvim',
      config = function()
	require('impatient').enable_profile()
      end
  }

  -- Looks & Feels
  -- Best colorscheme
  use 'josuegaleas/jay'

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true },
      config = function()
        require('lualine').setup()
      end
  }

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
      after = 'nvim-treesitter',
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
      after = 'nvim-treesitter',
  }

  -- Show indention
  use {
    'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('indent_blankline').setup({
		show_current_context = true,
		show_current_context_start = true,
	})
      end
  }
  -- Show whitespaces
  use 'ntpeters/vim-better-whitespace'

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
      config = function()
	require('cmp').setup()
      end
  }
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'

  -- LSP
  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup()
    end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').ruff_lsp.setup{}
    end
  }

  -- Tpope plugins
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-endwise'
  use 'tpope/vim-speeddating'
  use 'tpope/vim-eunuch'

  -- Automatically create pairwise brackets
  use {
    'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end
  }

  -- Easily create comments
  use {
    'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
  }

  -- Fuzzy finder for lists
  use {
    'nvim-telescope/telescope.nvim',
       tag = '0.1.x',
       requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Fileexplorer written in lua
  use {
    'kyazdani42/nvim-tree.lua',
       requires = { { 'kyazdani42/nvim-web-devicons' } },
       config = function()
         require('nvim-tree').setup()
       end
  }

  -- Beautiful notification messages
  use 'rcarriga/nvim-notify'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
