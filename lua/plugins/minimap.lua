local mapvimkey = require("util.keymapper").mapvimkey

local config = function()
    local minimap = require("minimap")

    minimap.setup({
        minimap_auto_start = 1, -- start minimap when opening file
        minimap_auto_start_win_enter = 1, -- start minimap when entering window
        minimap_git_colors = 1, -- enable git colors for minimap
        minimap_highlight_range = 1, -- highlight range under cursor
        minimap_highlight_search = 1, -- highlight search results
    })
end

return {
    "wfxr/minimap.vim",
    lazy = false,
    config = config,
    keys = {
        mapvimkey("<leader>mm", ":MinimapToggle", "MinimapToggle"),
    }
}