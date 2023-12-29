local config = function()
    local minimap = require("mini.map")

    minimap.setup()

    -- Automatically open the minimap when opening vim
    vim.cmd("autocmd VimEnter * MiniMap.open()")

end

return {
    "echasnovski/mini.map", 
    version = '*',
    lazy = false,
    cmd = 'MiniMap',
    config = config
}