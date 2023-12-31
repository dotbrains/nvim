-- get all subdirectories and Lua files from given directory
function get_plugin_paths(directory)
    local plugin_paths = {}

    -- Use Neovim's vim.loop.fs_scandir to iterate over directory contents
    local scan = vim.loop.fs_scandir(directory)
    if scan then
        while true do
            local filename, type = vim.loop.fs_scandir_next(scan)
            if not filename then break end

            if type == "directory" or string.match(filename, "%.lua$") then
                local path = directory .. '/' .. filename
                table.insert(plugin_paths, path)
            end
        end
    end

    return plugin_paths
end

return {
    get_plugin_paths = get_plugin_paths,
}
