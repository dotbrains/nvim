local mapvimkey = require("util.keymapper").mapvimkey

local init = function()
    vim.g.minimap_auto_start = 1
    vim.g.minimap_auto_start_win_enter = 1
    
    vim.g.minimap_highlight_range = 1
    vim.g.minimap_highlight_search = 1
end

return {
    "wfxr/minimap.vim", 
    lazy = false,
    init = init,
    keys = {
        mapvimkey("<leader>mm", ":MinimapToggle", "MinimapToggle"),
    }
}