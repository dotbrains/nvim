local mapvimkey = require("util.keymapper").mapvimkey

local config = function()
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
    end)
end

return {
    'VonHeikemen/lsp-zero.nvim', 
    branch = 'v3.x',
    config = config,
    keys = {
        mapvimkey("<leader>l", "LspInfo", "Lsp Info"),
        mapvimkey("<leader>I", "LspInstall", "Lsp Install"),
    }
}