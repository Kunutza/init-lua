local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Colorschemes
  { "rose-pine/neovim", name = "rose-pine" },
  { "sainnhe/sonokai", name = "sonokai" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c", "cpp", "lua", "python", "bash", "javascript", "typescript",
          "html", "json", "yaml", "markdown", "vim",
        },
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
        incremental_selection = { enable = true },
        playground = { enable = true },
        query_linter = { enable = true },
        sync_install = false,
        auto_install = true,
      })
    end,
  },
  { "nvim-treesitter/playground" },

  -- Harpoon
  "ThePrimeagen/harpoon",

  -- Undotree
  "mbbill/undotree",

  -- Fugitive
  "tpope/vim-fugitive",

  -- LSP + Autocomplete stack
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        -- LSP support
        { "neovim/nvim-lspconfig", version = "v0.11.0" },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Autocompletion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
    },
  },

}, {
  ui = { border = "rounded" },
})

