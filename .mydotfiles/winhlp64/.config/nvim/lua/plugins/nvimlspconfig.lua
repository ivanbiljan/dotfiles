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
                    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
                    callback = function(ev)
                        local opts = { buffer = ev.buf, silent = true }

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
                        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                        -- Code actions
                        opts.desc = "List available code actions"
                        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                        opts.desc = "Show diagnostics"
                        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics<CR>", opts)

                        -- Toggle inlay hints
                        opts.desc = "Toggle inlay hints"
                        vim.keymap.set("n", "<leader>ih", function()
                            vim.lsp.inlay_hint.enable(
                                not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }),
                                { bufnr = 0 }
                            )
                        end)

                        opts.desc = "Format buffer"
                        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

                        opts.desc = "Toggle inlay hints"
                        vim.keymap.set("n", "<leader>ih", function ()
                            local is_enabled = vim.lsp.inlay_hint.is_enabled({})
                            vim.lsp.inlay_hint.enable(not is_enabled)
                        end, opts)
                    end
                })

                vim.lsp.config("lua_ls", {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("lua", true)
                            },
                            hint = {
                                enable = true
                            }
                        }
                    }
                })

                vim.lsp.config("roslyn", {
                    settings = {
                        ["csharp|code_lens"] = {
                            dotnet_enable_references_code_lens = false
                        },
                        ["csharp|inlay_hints"] = {
                            csharp_enable_inlay_hints_for_implicit_object_creation = true,
                            csharp_enable_inlay_hints_for_implicit_variable_types = true,
                            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                            csharp_enable_inlay_hints_for_types = true,
                            csharp_enable_inlay_hints_for_indexer_parameters = true,
                            csharp_enable_inlay_hints_for_literal_parameters = true,
                            csharp_enable_inlay_hints_for_object_creation_parameters = true,
                            csharp_enable_inlay_hints_for_other_parameters = true,
                            csharp_enable_inlay_hints_for_parameters = true,
                        }
                    }
                })
            end
        }
    }
}
