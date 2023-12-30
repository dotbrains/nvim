local config = function()
	require("lualine").setup({
		options = {
			theme = "nord",
			globalstatus = true,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "buffers" },
			
			lualine_x = { "aerial" },
			lualine_y = {
					{
					"aerial",
					-- The separator to be used to separate symbols in status line.
					sep = " ) ",
			
					-- The number of symbols to render top-down. In order to render only 'N' last
					-- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
					-- be used in order to render only current symbol.
					depth = nil,
			
					-- When 'dense' mode is on, icons are not rendered near their symbols. Only
					-- a single icon that represents the kind of current symbol is rendered at
					-- the beginning of status line.
					dense = false,
			
					-- The separator to be used to separate symbols in dense mode.
					dense_sep = ".",
			
					-- Color the symbol icons.
					colored = true,
				},
			},

			lualine_z = { "location" },
		},
		tabline = {},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
