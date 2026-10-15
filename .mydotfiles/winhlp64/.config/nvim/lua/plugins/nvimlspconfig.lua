return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason.nvim",
        {
            "mason-org/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup({
                    automatic_enable = { exclude = { "roslyn_ls" } }
                })

                vim.api.nvim_create_autocmd("LspAttach", {
                    callback = function(ev)
                        local opts = { buffer = ev.buffer }

                        -- Show references
                        opts.desc = "Show LSP references"
                        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                        -- Go to definition
                        opts.desc = "Show LSP definitions"
                        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                        -- Go to declaration
                        opts.desc = "Go to Declaration"
                        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                        -- Show implementations
                        opts.desc = "Show implementations"
                        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                        -- Show documentation for what is under the cursor
                        opts.desc = "Show documentation for what is under the cursor"
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                        -- Signature help
                        opts.desc = "Show signature"
                        vim.keymap.set({ "n", "i", "v" }, "<C-k>", vim.lsp.buf.signature_help, opts)

                        opts.desc = "Rename symbol under the cursor"
                        vim.keymap.set("n", "<leader>rs", vim.lsp.buf.rename, opts)

                        -- Code actions
                        opts.desc = "List available code actions"
                        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                        -- Toggle inlay hints
                        opts.desc = "Toggle inlay hints"
                        vim.keymap.set("n", "<leader>ih", function()
                            vim.lsp.inlay_hint.enable(
                                not vim.lsp.inlay_hint.is_enabled({ bufnr = 0}),
                                { bufnr = 0}
                            )
                        end)

                        -- Format code
                        opts.desc = "Format code in buffer"
                        vim.keymap.set("n", "<leader>fc", function()
                            vim.lsp.buf.format { async = true }
                        end, opts)
                    end
                })

                vim.lsp.config("roslyn", {
                    settings = {
                        ["csharp|code_lens"] = {
                            dotnet_enable_references_code_lens = false
                        },
                        ["csharp|inlay_hints"] = {
                            csharp_enable_inlay_hints_for_implicit_object_creation = true,
                            csharp_enable_inlay_hints_for_implicit_variable_types = true
                        }
                    }
                })
            end
        }
    }
}
