return {
    {
		"dense-analysis/ale",
		event = { "BufReadPost", "BufNewFile" },
        config = function()
            vim.g.ale_fix_on_save = 1
            vim.g.ale_fixers = { "prettier", "eslint" }
        end
	},
}