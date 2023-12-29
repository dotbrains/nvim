local config = function()
    local minimap = require("mini.map")

    minimap.setup()
end

return {
    "echasnovski/mini.nvim", 
    version = '*' 
    lazy = false,
    config = config,
}