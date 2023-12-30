local opts = {
	ensure_installed = {
		"efm",
		"bashls",
		"tsserver",
		"tailwindcss",
		"pyright",
		"lua_ls",
		"emmet_ls",
		"jsonls",
		"clangd",
	},

	automatic_installation = true,
}

local config = function()
	local mason_lspconfig = require("mason-lspconfig")
	local lsp_zero = require("lsp-zero")
	local lspconfig = require("lspconfig")

	mason_lspconfig.setup({
		handlers = {
			lsp_zero.default_setup,
			lua_ls = function()
				local lua_opts = lsp_zero.nvim_lua_ls()
				lspconfig.lua_ls.setup(lua_opts)
			end,
		}
	})
end

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	config = config,
	event = "BufReadPre",
	dependencies = {
		"williamboman/mason.nvim",
		"VonHeikemen/lsp-zero.nvim",
		"neovim/nvim-lspconfig",
	},
}
