local gitconflict = require("git-conflict")
return {
	{
		"akinsho/git-conflict.nvim",
		event = "BufReadPost",
		version = "*",
		setup = {
			default_mappings = {
					ours = "<leader>co",
					theirs = "<leader>ct",
					none = "<leader>c0",
					both = "<leader>cb",
					next = "<leader>]x",
					prev = "<leader>[x",
				}
			}
	}
}

gitconflict.setup({
	,
})
