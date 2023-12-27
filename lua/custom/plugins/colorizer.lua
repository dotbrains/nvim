return {
    'NvChad/nvim-colorizer.lua', -- Plugin for colorizing color codes in Neovim
    config = function()
        require("colorizer").setup() -- Setup function for nvim-colorizer
    end
}