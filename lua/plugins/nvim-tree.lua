-- A file explorer tree for neovim written in lua.
-- see: https://github.com/nvim-tree/nvim-tree.lua

return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	requires = { "nvim-tree/nvim-web-devicons" }, -- Optional: for file icons
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = false,
			},
			view = {
				adaptive_size = true,
				width = 30, -- Set the width of the tree view
				side = "left", -- Position of the tree view
				mappings = {
					list = {
						{ key = {"<CR>", "o"}, action = "edit" }, -- Open file
						{ key = "O", action = "edit_no_picker" }, -- Open file without picker
						{ key = "e", action = "edit_in_place" }, -- Edit in place
						{ key = "u", action = "dir_up" }, -- Go up a directory
						{ key = "s", action = "split" }, -- Split window
						{ key = "v", action = "vsplit" }, -- Vertical split
					},
				},
			},
			git = {
				enable = true, -- Enable git integration
				ignore = false, -- Show ignored files
			},
			-- Other options can be added here
		})
	end,
}
