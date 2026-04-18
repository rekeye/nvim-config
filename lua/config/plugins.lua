return {
	-- colorscheme: load early
	{
		"stevedylandev/flexoki-nvim",
		name = "flexoki",
		priority = 1000, -- ensure it loads first
		config = function()
			vim.cmd("colorscheme flexoki")
		end,
	},

	-- Git / misc tools
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
	},

	-- Which-key (when idle)
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

	-- Todo plugin
	{
		"AmeerTaweel/todo.nvim",
		cmd = "Todo",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("todo").setup()
		end,
	},

	{
		"dense-analysis/ale",
		event = { "BufReadPost", "BufNewFile" },
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/typescript.nvim",
			{
				"glepnir/lspsaga.nvim",
				branch = "main",
				dependencies = {
					"nvim-tree/nvim-web-devicons",
					"nvim-treesitter/nvim-treesitter",
				},
			},
		},
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {},
	},

	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
	},

    {
		"ThePrimeagen/harpoon",
		keys = {
			{
				"<leader>h",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all" (the four listed parsers should always be installed)
				ensure_installed = { "javascript", "typescript", "go", "lua", "dart", "vim", "markdown", "markdown_inline" },

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				highlight = {
					enable = true,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
			})
		end
	},

	{
		"nvim-treesitter/playground",
		cmd = "TSPlaygroundToggle",
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		event = "VeryLazy",
	},

	-- Autotag (HTML/JSX)
	{
		"windwp/nvim-ts-autotag",
		event = "BufReadPost",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
