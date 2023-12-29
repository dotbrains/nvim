return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        -- BufferLine support
        -- see: https://github.com/shaunsingh/nord.nvim#bufferline-support
        local highlights = require("nord").bufferline.highlights({
            italic = true,
            bold = true,
        })
        
        options = {
            separator_style = "thin",
        },
        highlights = highlights,

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
    end
}
