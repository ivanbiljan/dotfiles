local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>fb", telescope.buffers, {})

vim.keymap.set("n", "<leader>gs", telescope.git_status, {})
vim.keymap.set("n", "<leader>gf", telescope.git_files, {})

vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
vim.keymap.set("n", "<C-p>", telescope.find_files, {})

vim.keymap.set("n", "<leader>ps", function()
    telescope.grep_string({ search = vim.fn.input("Grep > ") });
end, {})

vim.keymap.set("n", "<leader>fg", function()
    telescope.grep_string({ search = vim.fn.input("Grep > ") });
end, {})
