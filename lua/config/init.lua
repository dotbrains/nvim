local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require "config.globals"
require "config.options"
require "config.keymaps"
require "config.autocmds"

-- Initialize theme after plugins are loaded
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    require("config.theme").init()
  end,
})

local plugins = "plugins"

local opts = {
  defaults = {
    lazy = true, -- lazy load plugins
  },
  install = {
    colorscheme = { "nord" }, -- try to load one of these colorschemes when starting an installation during startup
  },
  rtp = {
    disabled_plugins = {
      "gzip",
      "matchit",
      "matchparen",
      "netrw",
      "netrwPlugin",
      "tarPlugin",
      "tohtml",
      "tutor",
      "zipPlugin",
    },
  },
}

require("lazy").setup(plugins, opts)
