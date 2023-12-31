local mapvimkey = require("util.keymapper").mapvimkey

return {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    keys = {
        mapvimkey("<C-h>", "TmuxNavigateLeft", "Navigate Window Left"),
        mapvimkey("<C-j>", "TmuxNavigateDown", "Navigate Window Down"),
        mapvimkey("<C-k>", "TmuxNavigateUp", "Navigate Window Up"),
        mapvimkey("<C-l>", "TmuxNavigateRight", "Navigate Window Right"),
    }
}