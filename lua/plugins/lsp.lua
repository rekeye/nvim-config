return {
	{ "neovim/nvim-lspconfig",
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
				},
			},
		},
		config = function()
			local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			if not cmp_nvim_lsp_status then
			return
			end

			local keymap = vim.keymap

			-- enable keybinds only for when lsp server available
			local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }

			keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
			keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
			keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
			keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
			keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
			keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
			keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
			keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
			keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
			keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
			keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
			keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

			if client.name == "ts_ls" then
				keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", opts)
				keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", opts)
				keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", opts)
			end
			end

			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Change the Diagnostic symbols in the sign column (gutter)
			local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
			for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- Configure servers using the new Nvim 0.11 API
			vim.lsp.config('html', {
			capabilities = capabilities,
			on_attach = on_attach,
			})

			vim.lsp.config('ts_ls', {
			capabilities = capabilities,
			on_attach = on_attach,
			})

			vim.lsp.config('cssls', {
			capabilities = capabilities,
			on_attach = on_attach,
			})

			vim.lsp.config('tailwindcss', {
			capabilities = capabilities,
			on_attach = on_attach,
			})

			vim.lsp.config('emmet_ls', {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
			})

			vim.lsp.config('lua_ls', {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
			})

			-- Enable all servers
			vim.lsp.enable({'html', 'ts_ls', 'cssls', 'tailwindcss', 'emmet_ls', 'lua_ls'})
			-- import mason plugin safely
			local mason_status, mason = pcall(require, "mason")
			if not mason_status then
			return
			end

			-- import mason-lspconfig plugin safely
			local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
			if not mason_lspconfig_status then
			return
			end

			-- import mason-null-ls plugin safely
			local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
			if not mason_null_ls_status then
			return
			end

			-- enable mason
			mason.setup()

			mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"roslyn"
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true,
			})

			mason_null_ls.setup({
			-- list of formatters & linters for mason to install
			ensure_installed = {
				"prettier", -- ts/js formatter
				"stylua", -- lua formatter
				"eslint_d", -- ts/js linter
			},
			-- auto-install configured formatters & linters (with null-ls)
			automatic_installation = true,
			})

			-- import lspsaga safely
			local saga_status, saga = pcall(require, "lspsaga")
			if not saga_status then
			return
			end

			saga.setup({
			-- keybinds for navigation in lspsaga window
			scroll_preview = { scroll_down = "<C-j>", scroll_up = "<C-k>" },
			-- use enter to open file with definition preview
			definition = {
				edit = "<CR>",
			},
			lightbulb = {
				virtual_text = false,
			},
			ui = {
				colors = {
					normal_bg = "#022746",
				},
			},
			})
		end
	}
}
