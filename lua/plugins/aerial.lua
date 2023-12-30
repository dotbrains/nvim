local mapvimkey = require("util.keymapper").mapvimkey

local config = function()
    local aerial = require('aerial')

    aerial.setup({
        on_attach = function(bufnr)
            -- Jump forwards/backwards with '{' and '}'
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
    })
end

return {
    'stevearc/aerial.nvim',
    opts = {},
    config = config,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        mapvimkey("<leader>a", "AerialToggle!", "Toggle Aerial")
    }
}