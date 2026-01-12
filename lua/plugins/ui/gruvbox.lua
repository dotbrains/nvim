return {
	"ellisonleao/gruvbox.nvim",
	name = "gruvbox",
	lazy = false,
	priority = 999,
	config = function()
		require("gruvbox").setup({
			contrast = "", -- can be "hard", "soft" or empty string
		})
	end,
}
