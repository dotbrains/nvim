-- get all subdirectories and Lua files from given directory
local function get_plugin_paths(directory)
    local plugin_paths = {}
    local scan

    -- Recursive function to scan directories
    scan = function(dir)
        local p = io.popen('find "'..dir..'" -type f')   -- Open directory look for files, save data to p. 
        for file in p:lines() do                         -- Loop through all files
            if file:match("%.lua$") then                 -- Filter out only Lua files
                table.insert(plugin_paths, file)
            end
        end
        p:close()
    end

    -- Start scanning from the base directory
    scan(directory)

    return plugin_paths
end

return {
    get_plugin_paths = get_plugin_paths,
}
