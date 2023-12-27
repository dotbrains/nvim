-- Set transparency
local is_transparent = true -- Set to false to disable transparency in 🪟
if vim.fn.has("unix") == 1 then
    is_transparent = true
end

return {
    {
        "shaunsingh/nord.nvim",
        dev = true,
        lazy = false,
        priority = 1000,
        config = function()
            require("nord").setup({
                transparent = is_transparent,
                italic_comments = true,
                hide_fillchars = true,
            })
            vim.cmd("colorscheme nord")
        end,
    },
}
