-- Quickstart configs for Nvim LSP
-- see: https://github.com/neovim/nvim-lspconfig

local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.icons").diagnostic_signs

local config = function()
  require("neoconf").setup {}
  local cmp_nvim_lsp = require "cmp_nvim_lsp"
  local capabilities = cmp_nvim_lsp.default_capabilities()

  for type, icon in pairs(diagnostic_signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  -- Global config for all LSP servers
  vim.lsp.config("*", {
    capabilities = capabilities,
  })

  -- LspAttach autocmd replaces per-server on_attach
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, args.buf)
    end,
  })

  -- lua
  vim.lsp.config("lua_ls", {
    settings = { -- custom settings for lua
      Lua = {
        -- make the language server recognize "vim" global
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          -- make language server aware of runtime files
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.stdpath "config" .. "/lua"] = true,
          },
        },
      },
    },
  })

  -- json
  vim.lsp.config("jsonls", {
    filetypes = { "json", "jsonc" },
  })

  -- python
  vim.lsp.config("pyright", {
    settings = {
      pyright = {
        disableOrganizeImports = false,
        analysis = {
          useLibraryCodeForTypes = true,
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          autoImportCompletions = true,
        },
      },
    },
  })

  -- typescript
  vim.lsp.config("ts_ls", {
    filetypes = {
      "typescript",
    },
    root_markers = { "package.json", "tsconfig.json", ".git" },
  })

  -- bash
  vim.lsp.config("bashls", {
    filetypes = { "sh", "aliasrc" },
  })

  -- typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
  vim.lsp.config("emmet_ls", {
    filetypes = {
      "typescriptreact",
      "javascriptreact",
      "javascript",
      "css",
      "sass",
      "scss",
      "less",
      "svelte",
      "vue",
      "html",
    },
  })

  -- docker
  vim.lsp.config("dockerls", {})

  -- C/C++
  vim.lsp.config("clangd", {
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  })

  local luacheck = require "efmls-configs.linters.luacheck"
  local stylua = require "efmls-configs.formatters.stylua"
  local flake8 = require "efmls-configs.linters.flake8"
  local black = require "efmls-configs.formatters.black"
  local eslint = require "efmls-configs.linters.eslint"
  local prettier_d = require "efmls-configs.formatters.prettier_d"
  local fixjson = require "efmls-configs.formatters.fixjson"
  local shellcheck = require "efmls-configs.linters.shellcheck"
  local shfmt = require "efmls-configs.formatters.shfmt"
  local hadolint = require "efmls-configs.linters.hadolint"
  local cpplint = require "efmls-configs.linters.cpplint"
  local clangformat = require "efmls-configs.formatters.clang_format"

  -- configure efm server
  vim.lsp.config("efm", {
    filetypes = {
      "lua",
      "python",
      "json",
      "jsonc",
      "sh",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "svelte",
      "markdown",
      "docker",
      "html",
      "css",
      "c",
      "cpp",
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = true,
      documentSymbol = true,
      codeAction = true,
      completion = true,
    },
    settings = {
      languages = {
        lua = { luacheck, stylua },
        python = { flake8, black },
        typescript = { eslint, prettier_d },
        json = { eslint, fixjson },
        jsonc = { eslint, fixjson },
        sh = { shellcheck, shfmt },
        javascript = { eslint, prettier_d },
        javascriptreact = { eslint, prettier_d },
        typescriptreact = { eslint, prettier_d },
        svelte = { eslint, prettier_d },
        markdown = { prettier_d },
        docker = { hadolint, prettier_d },
        html = { prettier_d },
        css = { prettier_d },
        c = { clangformat, cpplint },
        cpp = { clangformat, cpplint },
      },
    },
  })

  -- Enable all configured LSP servers
  vim.lsp.enable {
    "lua_ls",
    "jsonls",
    "pyright",
    "ts_ls",
    "bashls",
    "emmet_ls",
    "dockerls",
    "clangd",
    "efm",
  }
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
    "creativenull/efmls-configs-nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
  },
}
