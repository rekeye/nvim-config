return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = { "javascript", "typescript", "go", "lua", "dart", "vim", "markdown", "markdown_inline" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  },
}
