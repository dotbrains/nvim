local config = function()
    local minimap = require("mini.map")

    minimap.setup()
end

return {
    "echasnovski/mini.map", 
    version = '*',
    lazy = false,
    config = config
}