return 
{
    "itchyny/lightline.vim",
    lazy = false,
    config = function()
        vim.g.lightline = {
            colorscheme = "powerline",
        }
        vim.o.showmode = false  
    end
}
