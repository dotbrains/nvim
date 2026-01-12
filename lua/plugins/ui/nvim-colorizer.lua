-- The fastest colorizer for nvim
-- see: https://github.com/norcalli/nvim-colorizer.lua

return {
    'norcalli/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup()
    end
}
