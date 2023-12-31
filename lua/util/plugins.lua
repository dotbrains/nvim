local lfs = require('lfs')

-- get all subdirectories and Lua files from given directory
function get_plugin_paths(directory)
    local plugin_paths = {}

    for filename in lfs.dir(directory) do
        if filename ~= "." and filename ~= ".." then
            local path = directory .. '/' .. filename
            local attr = lfs.attributes(path)

            -- Check if it's a directory or a Lua file
            if attr.mode == 'directory' then
                table.insert(plugin_paths, path)
            elseif string.match(filename, "%.lua$") then  -- Check if the file is a Lua file
                table.insert(plugin_paths, path)
            end
        end
    end

    return plugin_paths
end

return {
    get_plugin_paths = get_plugin_paths,
}