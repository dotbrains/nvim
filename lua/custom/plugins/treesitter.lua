return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")

        config.setup({
            auto_install = true, -- Automatically install missing parsers
            highlight = {
                enable = true, -- Enable treesitter highlighting
            },
            indent = {
                enable = true, -- Enable treesitter indentation
            },
        })
    end
}