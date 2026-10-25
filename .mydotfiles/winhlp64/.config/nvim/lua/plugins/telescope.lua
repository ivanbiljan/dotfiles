return
{
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next
                    }
                },
                file_ignore_patterns = {
                    "%.git/",
                    "bin/",
                    "obj/",
                    "node_modules/",
                    "vendor/",
                    "dist/",
                    ".claude/",
                    ".mtk/"
                }
            }
        })
    end
}
