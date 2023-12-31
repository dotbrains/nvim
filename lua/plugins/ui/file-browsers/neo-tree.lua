-- Neo-tree is a Neovim plugin to browse the file system and other tree like 
-- structures in whatever style suits you, including sidebars, floating windows, 
-- netrw split style, or all of them at once!
-- see: https://github.com/nvim-neo-tree/neo-tree.nvim

local mapvimkey = require("util.keymapper").mapvimkey

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
    lazy = false,
	config = function()
        mapvimkey("<C-n>", "NeoTree filesystem reveal left", "Show NeoTree on the left")
        mapvimkey("<leader>bf", "NeoTree buffers reveal float", "Show NeoTree in a floating window")
	end,
}