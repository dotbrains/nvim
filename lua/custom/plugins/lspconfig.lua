return {
    "neovim/nvim-lspconfig", -- Basic configurations for the Neovim LSP client
    config = function()
        require "plugins.configs.lspconfig" -- Load default LSP configurations
        require "custom.configs.lspconfig" -- Load custom LSP configurations
    end
}