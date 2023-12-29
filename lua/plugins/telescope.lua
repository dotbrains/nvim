local mapvimkey = require("util.keymapper").mapvimkey

local config = function()
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			-- themes: dropdown | ivy | cursor
			find_files = {
				theme = "ivy",
				previewer = true,
				hidden = true,
				prompt_prefix = "🔍 ",
			},
			live_grep = {
				theme = "ivy",
				previewer = true,
			},
			buffers = {
				theme = "ivy",
				previewer = true,
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,                   -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true,    -- override the file sorter
				case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
												-- the default case_mode is "smart_case"
			}
		}
	})

	-- To get fzf loaded and working with telescope, you need to call
	-- load_extension, somewhere after setup function:
	require('telescope').load_extension('fzf')
end

return {
	{ 
		'nvim-telescope/telescope-fzf-native.nvim', 
		build = 'make' 
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		lazy = false,
		dependencies = { 
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		config = config,
		keys = {
			mapvimkey("<leader>fk", "Telescope keymaps", "Show Keymaps"),
			mapvimkey("<leader>fh", "Telescope help_tags", "Show Help Tags"),
			mapvimkey("<leader>ff", "Telescope find_files", "Find Files"),
			mapvimkey("<leader>fg", "Telescope live_grep", "Live Grep"),
			mapvimkey("<leader>fb", "Telescope buffers", "Find Buffers"),
		},
	}
}
