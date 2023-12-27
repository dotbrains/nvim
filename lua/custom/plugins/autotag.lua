return {
    "windwp/nvim-ts-autotag", -- Plugin for automatically closing and renaming HTML/XML tags
    ft = {
        "javascript", 
        "javascriptreact",
        "typescript", 
        "typescriptreact"
    }, -- File types where this plugin is active
    config = function() 
        require("nvim-ts-autotag").setup()
    end -- Setup function for nvim-ts-autotag
} 