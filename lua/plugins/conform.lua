return {
  {
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {},
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          lua = { "stylua" },
        },

        format_on_save = {
          timeout_ms = 2000,
          lsp_fallback = true,
        },
      })
    end
	},
}
