local mapvimkey = require("util.keymapper").mapvimkey

local init = function()
    vim.g.minimap_auto_start = 1
    vim.g.minimap_auto_start_win_enter = 1
end

return {
    "wfxr/minimap.vim", 
    version = '*',
    lazy = false,
    init = init,
    keys = {
        mapvimkey("<leader>mm", ":MinimapToggle", "MinimapToggle"),
    }
}