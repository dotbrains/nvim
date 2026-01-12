-- Theme switching utility
local M = {}

-- Available themes
M.themes = { "nord", "gruvbox" }
M.current_theme = "gruvbox" -- default theme

-- Function to switch to next theme
function M.switch_theme()
	local current_index = 1
	for i, theme in ipairs(M.themes) do
		if theme == M.current_theme then
			current_index = i
			break
		end
	end

	-- Get next theme (cycle back to first if at end)
	local next_index = (current_index % #M.themes) + 1
	local next_theme = M.themes[next_index]

	-- Apply the theme
	M.set_theme(next_theme)
end

-- Function to set a specific theme
function M.set_theme(theme_name)
	local success, err = pcall(function()
		vim.cmd("colorscheme " .. theme_name)
		M.current_theme = theme_name

		-- Update lualine theme to match
		local lualine_ok, lualine = pcall(require, "lualine")
		if lualine_ok then
			lualine.setup({
				options = {
					theme = theme_name,
				},
			})
		end

		print("Switched to " .. theme_name .. " theme")
	end)

	if not success then
		print("Error switching to " .. theme_name .. ": " .. err)
	end
end

-- Initialize with default theme
function M.init()
	M.set_theme(M.current_theme)
end

return M
