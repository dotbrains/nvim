return {
    "numToStr/comment.nvim",
    event = "BufReadPre",
    lazy = false,
    config = function()
        require("Comment").setup()
    end,
}