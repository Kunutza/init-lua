-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Disable warning about  no healthcheck found for nvim/deprecated
  -- use { "nvim/deprecated", disable = true }


  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Rose Pine colorscheme
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  -- Sonokai colorscheme
  use({ 'sainnhe/sonokai', as = 'sonokai' })

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')

  -- Harpoon
  use('ThePrimeagen/harpoon')

  -- Undotree
  use('mbbill/undotree')

  -- Fugitive (Git)
  use('tpope/vim-fugitive')

  -- LSP (lsp-zero v3)
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }

end)
