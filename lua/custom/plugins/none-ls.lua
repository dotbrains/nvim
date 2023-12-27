return {
    "nvimtools/none-ls.nvim", -- Plugin for additional language support via null-ls
    event = "VeryLazy", -- Load this plugin on a custom event named 'VeryLazy'
    opts = function() 
        return require "custom.configs.null-ls" 
    end -- Custom configuration for null-ls
}