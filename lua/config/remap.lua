vim.g.mapleader = " "
vim.keymap.set("i", "kj", "<esc>")
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>.', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>,', vim.diagnostic.setloclist, opts)
