local config = function()
	local wk = require("which-key")

	wk.setup({
		plugins = {
			spelling = true -- enabling this will show WhichKey when pressing z= to select spelling suggestions
		}
	})
end

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = config
}
