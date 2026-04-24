local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", function()
    local ok = pcall(builtin.git_files)
    if not ok then
        vim.notify("Not a git repository - falling back to find_files", vim.log.levels.WARN)
        builtin.find_files()
    end
end, {})
vim.keymap.set("n", "<C-p>", builtin.find_files, {}) 
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
