local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
    sources = {
        -- Lua formatters (requires stylua to be installed)
        null_ls.builtins.formatting.stylua, -- Lua formatter

        -- JavaScript formatters (requires prettierd and eslint_d to be installed)
        null_ls.builtins.formatting.prettierd -- Prettier formatter
        null_ls.builtins.diagnostics.eslint_d -- ESLint formatter

        -- Python formatters (requires black and isort to be installed)
        null_ls.builtins.formatting.black, -- Python formatter
        null_ls.builtins.formatting.isort, -- Python formatter (sorts imports)
    }

    on_attach = function(client, bufnr) -- Format the current buffer on save
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({bufnr = bufnr})
                end
            })
        end
    end

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.formatting) -- Format the current buffer using SPACE + gf
}

return opts
