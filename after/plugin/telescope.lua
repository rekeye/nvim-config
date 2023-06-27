local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

local telescope = require('telescope')
telescope.setup({
	defaults = {
		file_ignore_patterns = { 'node_modules' }
	}
})
telescope.load_extension("ui-select")
