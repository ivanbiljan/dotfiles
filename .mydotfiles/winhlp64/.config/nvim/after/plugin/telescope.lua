local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>fb", telescope.buffers, {})

vim.keymap.set("n", "<leader>gs", telescope.git_status, {})

vim.keymap.set("n", "<leader>pf", function()
    local ok = pcall(telescope.git_files)
    if not ok then
        vim.notify("Not a git repository - falling back to find_files", vim.log.levels.WARN)
        telescope.find_files()
    end
end, {})

vim.keymap.set("n", "<C-p>", telescope.find_files, {})

vim.keymap.set("n", "<leader>ps", function()
    telescope.grep_string({ search = vim.fn.input("Grep > ") });
end, {})
