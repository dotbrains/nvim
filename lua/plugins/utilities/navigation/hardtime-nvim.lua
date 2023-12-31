-- A Neovim plugin helping you establish good command workflow and habits.
-- see: https://github.com/m4xshen/hardtime.nvim

return {
	"m4xshen/hardtime.nvim",
	command = "Hardtime",
	event = "BufEnter",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
	},
	opts = {
		disable_mouse = false,
	},
}
