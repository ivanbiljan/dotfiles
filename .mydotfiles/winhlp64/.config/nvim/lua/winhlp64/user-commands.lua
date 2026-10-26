-- JetBrains ReSharper Tools
local INCLUDE_FLAG = "--include="

local function find_sln_root(path)
    return vim.fs.find(function(name)
        return name:match("%.slnx?$") ~= nil
    end, { path = path, upward = true, limit = 1 })[1]
end

local function find_sln_from_buf(bufnr)
    local file = vim.api.nvim_buf_get_name(bufnr)
    local buf_dir = file ~= "" and vim.fs.dirname(file) or vim.uv.cwd()
    local sln = find_sln_root(buf_dir)

    return sln, sln and vim.fs.normalize(vim.fs.dirname(sln))
end

local function complete_include_flag(arglead)
    if arglead:sub(1, #INCLUDE_FLAG) ~= INCLUDE_FLAG then
        return vim.startswith(INCLUDE_FLAG, arglead) and { INCLUDE_FLAG } or {}
    end

    local _, root = find_sln_from_buf(0)
    if not root then
        return {}
    end

    local value = arglead:sub(#INCLUDE_FLAG + 1)
    local head, partial = value:match("^(.*;)([^;]*)$")
    if not head then
        head, partial = "", value
    end

    local results = {}
    for _, match in ipairs(vim.fn.getcompletion(root .. "/" .. partial, "file")) do
        local rel = match:sub(#root + 2)
        table.insert(results, INCLUDE_FLAG .. head .. rel)
    end

    return results
end

---@return string[]? includes, string? err
local function parse_includes(fargs)
    local includes = {}
    for _, arg in ipairs(fargs) do
        if not vim.startswith(arg, INCLUDE_FLAG) then
            return nil, "Unknwon argument '" .. arg .. "'"
        end
        for pattern in arg:sub(#INCLUDE_FLAG + 1):gmatch("[^;]+") do
            table.insert(includes, pattern)
        end
    end

    return includes
end

local function reload_buffers()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and not vim.bo[buf].modified then
            vim.cmd("silent! edit")
        end
    end
end

vim.api.nvim_create_user_command(
    "JBCleanup",
    function(args)
        local includes, parse_includes_err = parse_includes(args.fargs)
        if not includes then
            vim.notify(parse_includes_err or "Unable to parse --include list", vim.log.levels.ERROR)
            return
        end

        -- Some refactorings (such as member reordering) require semantic analysis of the entire sln
        -- TODO: Rider loads the sln on startup. See if something similar can be done here
        local bufnr = vim.api.nvim_get_current_buf()
        local sln, root = find_sln_from_buf(bufnr)
        local cwd, cmd

        if #includes == 0 then
            local allowed_filetypes = {
                cs = true,
                cshtml = true,
                razor = true
            }

            if not allowed_filetypes[vim.bo[bufnr].filetype] then
                vim.notify("ReSharper code cleanup is only available for C# files", vim.log.levels.ERROR)
                return
            end

            local file = vim.api.nvim_buf_get_name(bufnr)
            if file == "" then
                vim.notify("Buffer has no file on disk", vim.log.levels.WARN)
                return
            end

            if sln then
                cwd = vim.fs.dirname(sln)
                local rel_file_path = file:sub(#cwd + 2)
                cmd = { "dotnet", "tool", "run", "jb", "cleanupcode", sln, "--include=" .. rel_file_path }
            else
                cmd = { "dotnet", "tool", "run", "jb", "cleanupcode", vim.fn.expand("%") }
            end

            vim.cmd("silent update")
        else
            if not sln then
                vim.notify(
                    "The --include flag must be used within the context of a dotnet .sln(x)" ..
                    "but no solution was found for the current buffer's directory",
                    vim.log.levels.ERROR)
                return
            end

            cwd = root
            cmd = { "dotnet", "tool", "run", "jb", "cleanupcode", sln, INCLUDE_FLAG .. table.concat(includes, ";") }

            vim.cmd("silent! wall")
        end

        vim.notify("Running ReSharper code cleanup...")

        vim.system(
            cmd,
            { cwd = cwd, text = true },
            function(out)
                vim.schedule(function()
                    if out.code ~= 0 then
                        local err = (out.stderr ~= "" and out.stderr) or out.stdout or ""
                        vim.notify("ReSharper code cleanup failed:\n" .. err, vim.log.levels.ERROR)
                    end

                    reload_buffers()

                    vim.notify("ReSharper code cleanup completed")
                end)
            end)
    end,
    {
        desc = "Runs ReSharper's code cleanup",
        nargs = "*",
        complete = complete_include_flag
    }
)
