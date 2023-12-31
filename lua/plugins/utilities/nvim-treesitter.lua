local config = function()
	require("nvim-treesitter.configs").setup({
		build = ":TSUpdate",
		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,
		highlight = {
			enable = true
		},
		indent = {
			enable = true
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	config = config,
}
