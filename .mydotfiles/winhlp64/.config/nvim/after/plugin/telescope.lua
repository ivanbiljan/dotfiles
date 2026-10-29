local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>fb", telescope.buffers, {})

vim.keymap.set("n", "<leader>gs", telescope.git_status, { desc = "Lists git status for the current directory" })
vim.keymap.set("n", "<leader>gf", telescope.git_files, { desc = "Fuzzy search for files tracked by git" })

vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Search for files" })
vim.keymap.set("n", "<C-p>", telescope.find_files, { desc = "Search for files" })

vim.keymap.set("n", "<leader>ps", function()
    telescope.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Performs a grep search" })

vim.keymap.set("n", "<leader>fg", function()
    telescope.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Performs a grep search" })
