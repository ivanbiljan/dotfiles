return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter")

            local ensure_installed = {
                "bash",
                "c_sharp",
                "css",
                "dockerfile",
                "go",
                "html",
                "hyprlang",
                "lua",
                "rust",
                "tsx",
                "typescript",
                "vim",
                "vimdoc"
            }

            treesitter.install(ensure_installed)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function (args)
                    local buffer = vim.bo[args.buf]

                    local lang = vim.treesitter.language.get_lang(buffer.filetype)
                    if not lang then
                        return
                    end

                    local started = pcall(vim.treesitter.start, args.buf, lang)
                    local indentation_exclusions = { "cs", "lua" }

                    if started and not vim.list_contains(indentation_exclusions, args.match) then
                        buffer.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                        buffer.smartindent = false
                        buffer.cindent = false
                    end
                end
            })
        end
    },
    {
        "windwp/nvim-ts-autotag",
        enabled = true,
        ft = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact" },
        config = function ()
            local autotag = require("nvim-ts-autotag")
            autotag.setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_onSlash = false
                },
                per_filetype = {
                    ["html"] = {
                        enable_cloes = true
                    },
                    ["typescriptreact"] = {
                        enable_close = true
                    }
                }
            })
        end
    }
}
