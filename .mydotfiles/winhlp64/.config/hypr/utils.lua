function load_config(category, file_name)
    file_name = file_name:gsub(".lua", "")
    require("conf." .. category .. "." .. file_name)
end
