local get_plugin_paths = require("util.plugins").get_plugin_paths

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("config.globals")
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- get plugins directory
local plugins_directory = vim.fn.stdpath("config") .. "/lua/" .. plugins

-- get all plugin paths 
local plugin_paths = get_plugin_paths(plugins_directory)
print("plugin_paths: ", vim.inspect(plugin_paths))

-- add plugin paths to plugins table
local plugins = plugin_paths

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

-- require("lazy").setup(plugins, opts)
