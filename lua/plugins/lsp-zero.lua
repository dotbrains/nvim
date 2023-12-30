local mapvimkey = require("util.keymapper").mapvimkey

return {
    'VonHeikemen/lsp-zero.nvim', 
    branch = 'v3.x',
    config = false,
    keys = {
        mapvimkey("<leader>l", "LspInfo", "Lsp Info"),
        mapvimkey("<leader>I", "LspInstall", "Lsp Install"),
    }
}