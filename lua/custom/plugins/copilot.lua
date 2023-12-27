return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    auto_trigger = true,
                },
                panel = { enabled = false },
                filetypes = {
                    markdown = true,
                    yaml = true,
                    help = true,
                },
            })
        end,
    },
    {
        -- Integration of copilot.lua with nvim-cmp for autocompletion
        -- see: https://gist.github.com/ianchesal/93ba7897f81618ca79af01bc413d0713
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "zbirenbaum/copilot-cmp", -- Plugin dependency for copilot-cmp
                config = function()
                    require("copilot_cmp").setup() -- Setup for copilot-cmp
                end
            }
        },
        opts = {
            sources = {
                {name = "nvim_lsp", group_index = 2}, -- LSP source for completion
                {name = "copilot", group_index = 2}, -- Copilot source for completion
                {name = "luasnip", group_index = 2}, -- LuaSnip source for snippets
                {name = "buffer", group_index = 2}, -- Buffer source for completion
                {name = "nvim_lua", group_index = 2}, -- Neovim Lua API source for completion
                {name = "path", group_index = 2} -- File path source for completion
            }
        }
    }
}