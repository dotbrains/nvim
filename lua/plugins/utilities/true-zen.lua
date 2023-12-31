-- Clean and elegant distraction-free writing for NeoVim.
-- see: https://github.com/pocco81/true-zen.nvim

local mapvimkey = require("util.keymapper").mapvimkey

return {
	"pocco81/true-zen.nvim",
	lazy = false,
	config = function()
		local api = vim.api

		-- normal mode mappings
		mapvimkey("<leader>zn", "TZNarrow", "Narrow")
		mapvimkey("<leader>zf", "TZFocus", "Focus")
		mapvimkey("<leader>zm", "TZMinimalist", "Minimalist")
		mapvimkey("<leader>za", "TZAtaraxis", "Ataraxis")

		-- visual mode mappings
		mapvimkey("<leader>zn", ":'<,'>TZNarrow", "Narrow", "v")
	end
}
