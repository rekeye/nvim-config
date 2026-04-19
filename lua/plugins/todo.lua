return {
    "AmeerTaweel/todo.nvim",
    cmd = "Todo",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("todo").setup()
    end,
}