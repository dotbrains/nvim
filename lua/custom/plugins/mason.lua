return {
    "williamboman/mason.nvim", -- Plugin for managing LSP servers, formatters, linters, etc.
    opts = {
        ensure_installed = {
            -- Specified LSP servers to install
            "eslint-lsp", 
            "prettierd",
            "typescript-language-server"
        }
    }
}