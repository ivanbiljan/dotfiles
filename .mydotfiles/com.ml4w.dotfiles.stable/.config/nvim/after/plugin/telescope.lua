local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", function()
    if not pcall(builtin.git_files) then
        vim.notify("The current directory is not a git repository. Consider <C-p>", vim.log.levels.WARN)
    end
end, {})
vim.keymap.set("n", "<C-p>", builtin.find_files, {}) 
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
