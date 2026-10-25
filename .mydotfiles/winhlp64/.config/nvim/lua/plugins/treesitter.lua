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
                    local buf = args.buf
                    local filetype = vim.bo[buf].filetype

                    local lang = vim.treesitter.language.get_lang(filetype)
                    if not lang then
                        return
                    end

                    local initialized = pcall(vim.treesitter.start, buf, lang)
                    local noIndent = { "cs" }

                    if initialized and not vim.list_contains(noIndent, args.match) then
                        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                        vim.bo[buf].smartindent = false
                        vim.bo[buf].cindent = false
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
