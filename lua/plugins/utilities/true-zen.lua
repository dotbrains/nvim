-- Clean and elegant distraction-free writing for NeoVim.
-- see: https://github.com/pocco81/true-zen.nvim

return {
	"pocco81/true-zen.nvim",
	lazy = false,
	config = function()
		local api = vim.api

		api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
		api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
		api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
		api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
		api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})
	end
}
