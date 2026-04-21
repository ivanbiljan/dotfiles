return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason.nvim",
        {
            "mason-org/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup({
                })
            end
        }
    }
}
