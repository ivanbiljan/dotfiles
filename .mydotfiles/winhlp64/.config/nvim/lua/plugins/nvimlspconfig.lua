return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason.nvim",
        {
            "mason-org/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup({
                    automatic_enable = true
                })

                vim.api.nvim_create_autocmd("LspAttach", {
                    callback = function(ev)
                        local opts = { buffer = ev.buffer }
                        vim.keymap.set("n", "gD", vim.lsp.buf.definition, opts)
                        vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                        vim.keymap.set("n", "<leader>fc", function()
                            vim.lsp.buf.format { async = true }
                        end, opts)
                    end
                })
            end
        }
    }
}
