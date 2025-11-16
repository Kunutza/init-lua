local ts_install = require("nvim-treesitter.install")
ts_install.prefer_git = true
ts_install.compilers = { "gcc", "clang" }


require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  -- ensure_installed = "all",
  -- ensure_installed = {"rust", "javascript", "c"},
  ensure_installed = {
    "c",
    "cpp",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "bash",
    "json",
    "python",
    "zig"
  },
    -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ignore_install = {
    "ipkg",
    "poe_filter",
    "phpdoc",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
})
