return {
    "nvim-treesitter/nvim-treesitter", -- Treesitter plugin for better syntax highlighting
    opts = function()
        local opts = require "plugins.configs.treesitter"
        opts.ensure_installed = {
            "lua", "javascript", "typescript", "tsx", "css"
        } -- Specify languages for Treesitter
        return opts
    end
}