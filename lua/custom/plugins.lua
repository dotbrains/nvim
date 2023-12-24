local plugins = {
    { -- Nord theme
        -- Description: Nord color scheme for Neovim
        -- see: https://github.com/shaunsingh/nord.nvim
        "shaunsingh/nord.nvim"
    }, { -- A small (Neo)Vim wrapper for zoxide.
        -- Description: Integrates zoxide, a smarter cd command, with Neovim
        -- see: https://github.com/nanotee/zoxide.vim
        "nanotee/zoxide.vim"
    }, { -- An extension for telescope.nvim to use zoxide within Neovim.
        -- Description: Allows navigating directories using zoxide through Telescope
        -- see: https://github.com/jvgrootveld/telescope-zoxide
        "jvgrootveld/telescope-zoxide"
    }, {
        -- Enhanced replacement for copilot.vim with additional features
        -- see: https://github.com/zbirenbaum/copilot.lua
        "zbirenbaum/copilot.lua",
        event = "InsertEnter", -- Load this plugin when entering insert mode
        opts = require("custom.configs.overrides").copilot -- Custom configuration for copilot
    }, {
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
    }, {
        "neovim/nvim-lspconfig", -- Basic configurations for the Neovim LSP client
        config = function()
            require "plugins.configs.lspconfig" -- Load default LSP configurations
            require "custom.configs.lspconfig" -- Load custom LSP configurations
        end
    }, {
        "williamboman/mason.nvim", -- Plugin for managing LSP servers, formatters, linters, etc.
        opts = {
            ensure_installed = {
                "eslint-lsp", "prettierd", -- Specified LSP servers to install
                "typescript-language-server"
            }
        }
    }, {
        "nvimtools/none-ls.nvim", -- Plugin for additional language support via null-ls
        event = "VeryLazy", -- Load this plugin on a custom event named 'VeryLazy'
        opts = function() return require "custom.configs.null-ls" end -- Custom configuration for null-ls
    }, {
        "windwp/nvim-ts-autotag", -- Plugin for automatically closing and renaming HTML/XML tags
        ft = {"javascript", "javascriptreact", "typescript", "typescriptreact"}, -- File types where this plugin is active
        config = function() require("nvim-ts-autotag").setup() end -- Setup function for nvim-ts-autotag
    }, {
        "nvim-treesitter/nvim-treesitter", -- Treesitter plugin for better syntax highlighting
        opts = function()
            local opts = require "plugins.configs.treesitter"
            opts.ensure_installed = {
                "lua", "javascript", "typescript", "tsx", "css"
            } -- Specify languages for Treesitter
            return opts
        end
    }, {
        'NvChad/nvim-colorizer.lua', -- Plugin for colorizing color codes in Neovim
        config = function()
            require("colorizer").setup() -- Setup function for nvim-colorizer
        end
    }
}

return plugins -- Return the configured plugins
