-- Health check for nvim configuration dependencies
local M = {}

local health = vim.health or require("health")

-- List of required dependencies
local dependencies = {
	{ name = "git", cmd = "git --version", desc = "Version control" },
	{ name = "nvim", cmd = "nvim --version", desc = "Neovim" },
	{ name = "rg", cmd = "rg --version", desc = "Ripgrep (required for Telescope)" },
	{ name = "fd", cmd = "fd --version", desc = "fd (required for Telescope)" },
	{ name = "lazygit", cmd = "lazygit --version", desc = "LazyGit interface" },
	{ name = "node", cmd = "node --version", desc = "Node.js (for LSP servers)" },
	{ name = "npm", cmd = "npm --version", desc = "npm (for LSP servers)" },
}

-- List of optional dependencies
local optional_dependencies = {
	{ name = "lua-language-server", cmd = "lua-language-server --version", desc = "Lua LSP" },
	{ name = "efm-langserver", cmd = "efm-langserver --version", desc = "EFM language server" },
	{ name = "stylua", cmd = "stylua --version", desc = "Lua formatter" },
	{ name = "prettier", cmd = "prettier --version", desc = "Code formatter" },
	{ name = "code-minimap", cmd = "code-minimap --version", desc = "Code minimap" },
	{ name = "deno", cmd = "deno --version", desc = "Deno runtime" },
	{ name = "google-java-format", cmd = "google-java-format --version", desc = "Java formatter" },
}

-- Check if a command exists
local function check_command(cmd)
	local handle = io.popen(cmd .. " 2>&1")
	if handle then
		local result = handle:read("*a")
		handle:close()
		return result ~= nil and result ~= ""
	end
	return false
end

-- Main health check function
function M.check()
	health.start("nvim configuration dependencies")

	-- Check required dependencies
	health.info("Checking required dependencies...")
	for _, dep in ipairs(dependencies) do
		if check_command(dep.cmd) then
			health.ok(dep.name .. " is installed (" .. dep.desc .. ")")
		else
			health.error(dep.name .. " is not installed (" .. dep.desc .. ")")
		end
	end

	-- Check optional dependencies
	health.info("Checking optional dependencies...")
	for _, dep in ipairs(optional_dependencies) do
		if check_command(dep.cmd) then
			health.ok(dep.name .. " is installed (" .. dep.desc .. ")")
		else
			health.warn(dep.name .. " is not installed (" .. dep.desc .. ")")
		end
	end

	-- Check Neovim version
	local version = vim.version()
	if version.major >= 0 and version.minor >= 9 then
		health.ok(string.format("Neovim version %d.%d.%d (>= 0.9.0)", version.major, version.minor, version.patch))
	else
		health.error(
			string.format("Neovim version %d.%d.%d is too old (requires >= 0.9.0)", version.major, version.minor, version.patch)
		)
	end

	-- Check if lazy.nvim is installed
	local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if vim.loop.fs_stat(lazy_path) then
		health.ok("lazy.nvim is installed")
	else
		health.error("lazy.nvim is not installed")
	end

	-- Check if config files exist
	local config_files = {
		"lua/config/init.lua",
		"lua/config/options.lua",
		"lua/config/keymaps.lua",
		"lua/config/autocmds.lua",
		"lua/config/theme.lua",
	}

	health.info("Checking configuration files...")
	for _, file in ipairs(config_files) do
		local full_path = vim.fn.stdpath("config") .. "/" .. file
		if vim.loop.fs_stat(full_path) then
			health.ok(file .. " exists")
		else
			health.error(file .. " is missing")
		end
	end

	health.info("Health check complete!")
	health.info("Run ':checkhealth' to see detailed health information for all plugins")
end

return M
