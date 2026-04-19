return {
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
			{ "<leader>ca", vim.lsp.buf.code_action },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",   -- <-- here
		},
		config = function()
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
		end
	},
}