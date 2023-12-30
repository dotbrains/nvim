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

	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	}
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
