return 
{
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup {
            defaults = {
                file_ignore_patterns = {
                    "%.git/",
                    "bin/",
                    "obj/",
                    "node_modules/",
                    "vendor/",
                    "dist/",
                }
            }
        }
    end
}
