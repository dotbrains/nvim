local mapvimkey = require("util.keymapper").mapvimkey

local init = function()
    vim.g.minimap_auto_start = 1
end

return {
    "wfxr/minimap.vim", 
    lazy = false,
    init = init,
    keys = {
        mapvimkey("<leader>mm", ":MinimapToggle", "MinimapToggle"),
    }
}