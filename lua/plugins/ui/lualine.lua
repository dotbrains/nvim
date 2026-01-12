-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
-- see: https://github.com/nvim-lualine/lualine.nvim

local config = function()
	local theme_module = require("config.theme")
	require("lualine").setup({
		options = {
			theme = theme_module.current_theme,
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
