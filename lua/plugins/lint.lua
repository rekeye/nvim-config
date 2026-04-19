return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }

      -- only run eslint if config exists
      local function has_eslint_config()
        local files = {
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.json",
          "eslint.config.js",
        }

        for _, file in ipairs(files) do
          if vim.fn.filereadable(vim.fn.getcwd() .. "/" .. file) == 1 then
            return true
          end
        end
        return false
      end

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
        callback = function()
          if has_eslint_config() then
            lint.try_lint()
          end
        end,
      })
    end
	},
}