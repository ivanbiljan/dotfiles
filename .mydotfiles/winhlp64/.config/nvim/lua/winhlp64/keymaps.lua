local map = vim.keymap.set

-- Set Space as leader key
vim.g.mapleader = " "

map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit<CR>")

-- Clear highlight search
map("n", "<leader>hs", ":nohlsearch<CR>")
map("v", "<leader>hs", ":nohlsearch<CR>")

-- Delete character under cursor without overriding the buffer
map("n", "x", '"_x')

-- Paste over selection without losing yanked
map("x", "p", [["_dP]])

-- Noop arrow keys to force hjkl
map('n', '<up>', '<nop>')
map('n', '<down>', '<nop>')
map('n', '<left>', '<nop>')
map('n', '<right>', '<nop>')
map('i', '<up>', '<nop>')
map('i', '<down>', '<nop>')
map('i', '<left>', '<nop>')
map('i', '<right>', '<nop>')

-- Automatically center the cursor
map("n", "j", "gjzz")        -- go down one line respecting wrapped lines and center
map("n", "k", "gkzz")        -- go up one line respecting wrapped lines and center
map("n", "G", "Gzz")         -- go to line / end of file and center
map("n", "#", "#zz")         -- search backward for word under cursor and center
map("n", "*", "*zz")         -- search forward for word under cursor and center
map("n", "w", "wzz")         -- foward one word and center
map("n", "W", "Wzz")         -- foward whitespace delimited word and center
map("n", "e", "ezz")         -- end of word and center
map("n", "E", "Ezz")         -- end of whitespace delimited word and center
map("n", "b", "bzz")         -- back one word and center
map("n", "B", "Bzz")         -- back one whitespace delimited word and center
map("n", "H", "Hzz")         -- top of visible screen and center
map("n", "L", "Lzz")         -- bottom of visible screen and center
map("n", "0", "0zz")         -- start of line and center
map("n", "$", "$zz")         -- end of line and center
map("n", "^", "^zz")         -- first non blank char of line and center
map("n", "u", "uzz")         -- undo and center
map("n", "(", "(zz")         -- previous sentence and center
map("n", ")", ")zz")         -- next sentence and center
map("n", "{", "{zz")         -- previous para and center
map("n", "}", "}zz")         -- next para and center
map("n", "[{", "[{zz")       -- jump to opening { of current block and center
map("n", "]}", "]}zz")       -- jump to closing } of current block and center
map("n", "gd", "gdzz")       -- go to declaration and center
map("n", "gD", "gDzz")       -- go to declaration and center
map("n", "<C-D>", "<C-D>zz") -- move down and center
map("n", "<C-U>", "<C-U>zz") -- move up and center
map("n", "n", "nzzzv")       -- next search result and center
map("n", "N", "Nzzzv")       -- previous search result and center

-- Splits
map("n", "<leader>sv", "<C-w>v")
map("n", "<leader>sh", "<C-w>s")
map("n", "<leader>sx", "<cmd>close<CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize with arrows
map("n", "<C-Up>", "<cmd>resize -1<CR><cmd><CR>")
map("n", "<C-Down>", "<cmd>resize +1<CR><cmd><CR>")
map("n", "<C-Left>", "<cmd>vertical resize -1<CR><cmd><CR>")
map("n", "<C-Right>", "<cmd>vertical resize +1<CR><cmd><CR>")

-- Move selected text up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Indentation
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Misc/tools
map("n", "<leader>jbc", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local allowed = { cs = true, razor = true, cshtml = true }

    if not allowed[vim.bo[bufnr].filetype] then
        vim.notify("ReSharper cleanup is only available for C#/Razor files", vim.log.levels.WARN)
        return
    end

    local file = vim.api.nvim_buf_get_name(bufnr)
    if file == "" then
        vim.notify("Buffer has no file on disk", vim.log.levels.WARN)
        return
    end

    vim.cmd("silent update") -- ensure JB Tools see the latest changes

    -- Some refactorings (such as member reordering) require semantic analysis of the entire sln
    local sln = vim.fs.find(function(name)
        return name:match("%.slnx?$") ~= nil
    end, { path = vim.fs.dirname(file), upward = true, limit = 1 })[1]

    local cmd, cwd
    if sln then
        cwd = vim.fs.dirname(sln)
        local rel = file:sub(#cwd + 2) -- path relative to the solution folder
        cmd = { "dotnet", "tool", "run", "jb", "cleanupcode", sln, "--include=" .. rel }
    else
        cmd = { "dotnet", "tool", "run", "jb", "cleanupcode", vim.fn.expand("%") }
    end

    vim.notify("Running ReSharper cleanup…")

    vim.system(cmd, { cwd = cwd, text = true }, function(res)
        vim.schedule(function()
            if res.code ~= 0 then
                local out = (res.stderr ~= "" and res.stderr) or res.stdout or ""
                vim.notify("ReSharper cleanup failed:\n" .. out, vim.log.levels.ERROR)
                return
            end

            if vim.api.nvim_buf_is_valid(bufnr) and not vim.bo[bufnr].modified then
                vim.api.nvim_buf_call(bufnr, function() vim.cmd("edit") end)
            end

            vim.notify("ReSharper cleanup finished")
        end)
    end)
end, { desc = "Run ReSharper code cleanup on the current buffer" })
