return {
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },
    {
        "rockyzhang24/arctic.nvim",
        dependencies = { "rktjmp/lush.nvim" },
        name = "arctic",
        branch = "main",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme arctic")
        end
    },
    {
        "itchyny/lightline.vim",
        lazy = false,
        config = function()
            vim.g.lightline = {
                colorscheme = "powerline",
            }
            vim.o.showmode = false  
        end,
    }
}
