-- neoconf.nvim is a Neovim plugin to manage global and project-local settings.
-- see: https://github.com/folke/neoconf.nvim

return {
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  { import = "plugins.ui" },
  { import = "plugins.lsp" },
  { import = "plugins.editor" },
  { import = "plugins.git" },
  { import = "plugins.completion" },
  { import = "plugins.debug" },
  { import = "plugins.terminal" },
}
