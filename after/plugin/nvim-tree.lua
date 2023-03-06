-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<leader>tc", vim.cmd.NvimTreeClose)

