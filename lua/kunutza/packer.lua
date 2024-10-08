-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')
  -- Telescope
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Rose Pine colorsheme
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  -- Sonokai colorscheme
  use({ 'sainnhe/sonokai', as = 'sonokai' })
  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  -- Harpoon
  use('ThePrimeagen/harpoon')
  -- Undotree
  use('mbbill/undotree')
  -- Fugitive, is for git
  use('tpope/vim-fugitive') 
  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {                                      -- Optional
		  'williamboman/mason.nvim',
		  run = function()
			  pcall(vim.cmd, 'MasonUpdate')
		  end,
	  },
	  {'williamboman/mason-lspconfig.nvim'}, -- Optional

	  -- Autocompletion
	  {'hrsh7th/nvim-cmp'},     -- Required
	  {'hrsh7th/cmp-nvim-lsp'}, -- Required
	  {'L3MON4D3/LuaSnip'},     -- Required
  }
}
end)
