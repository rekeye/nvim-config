return {
    "stevedylandev/flexoki-nvim",
    name = "flexoki",
    priority = 1000, -- ensure it loads first
    config = function()
        vim.cmd("colorscheme flexoki")
    end,
}
