return {
    -- Nord theme
    -- Description: Nord color scheme for Neovim
    -- see: https://github.com/shaunsingh/nord.nvim
    "shaunsingh/nord.nvim",
    config = function()
        -- LuaLine support
        -- see: https://github.com/shaunsingh/nord.nvim#-usage
        require('lualine').setup {
            options = {
                theme = 'nord'
            }
        }

        -- Headline support
        -- see: https://github.com/shaunsingh/nord.nvim#headlines-support
        require("headlines").setup({
            markdown = {
                headline_highlights = {
                    "Headline1",
                    "Headline2",
                    "Headline3",
                    "Headline4",
                    "Headline5",
                    "Headline6",
                },
                codeblock_highlight = "CodeBlock",
                dash_highlight = "Dash",
                quote_highlight = "Quote",
            },
        })

        -- BufferLine support
        -- see: https://github.com/shaunsingh/nord.nvim#bufferline-support
        local highlights = require("nord").bufferline.highlights({
            italic = true,
            bold = true,
        })
        
        require("bufferline").setup({
            options = {
                separator_style = "thin",
            },
            highlights = highlights,
        })
        
        -- Slant BufferLine separator
        -- local highlights = require("nord").bufferline.highlights({
        --     italic = true,
        --     bold = true,
        --     fill = "#181c24"
        -- })
        
        -- require("bufferline").setup({
        --     options = {
        --         separator_style = "slant",
        --     },
        --     highlights = highlights,
        -- })
    end,
}