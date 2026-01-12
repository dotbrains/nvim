-- 🔥 No-nonsense floating terminal plugin for neovim 🔥
-- see: https://github.com/numToStr/FTerm.nvim

local mapvimkey = require("util.keymapper").mapvimkey

local config = function()
    require("FTerm").setup({
        blend = 5,
        dimensions = {
            height = 0.90,
            width = 0.90,
            x = 0.5,
            y = 0.5
        }
    })

    -- Function to disable space as leader key
    local function disable_space_leader()
        vim.api.nvim_set_keymap('n', '<leader>', '<nop>', { noremap = true, silent = true })
    end

    -- Function to restore space as leader key
    local function restore_space_leader()
        vim.api.nvim_set_keymap('n', '<leader>', ' ', { noremap = true, silent = true })
    end

    -- Autocommand to disable space when FTerm is opened
    vim.cmd [[
      augroup FTermKeymap
        autocmd!
        autocmd User FTermOpen lua disable_space_leader()
        autocmd User FTermClose lua restore_space_leader()
      augroup END
    ]]
end

local opts = {
    noremap = true,
    silent = true,
}

return {
    "numToStr/FTerm.nvim",
    config = config,
    opts = opts,
    keys = {
        -- normal mode mappings
        mapvimkey("<leader>t", "lua require('FTerm').toggle()"),
    }
}
