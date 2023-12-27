return {
    "numToStr/Comment.nvim",
    event = "BufReadPre",
    lazy = false,
    config = function()
        require("Comment").setup()
    end,
}