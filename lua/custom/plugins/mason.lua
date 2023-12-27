return {
    {
        "williamboman/mason.nvim", -- Plugin for managing LSP servers, formatters, linters, etc.
        lazy = false,
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim", -- Bridges the gap between Mason and nvim-lspconfig.
        config = function()
            require( "mason-lspconfig").setup({
            automatic_installation = true, -- Automatically install missing LSP servers
        })
        end
    }
}