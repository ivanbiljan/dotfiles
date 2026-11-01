vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.INFO]  = "",
            [vim.diagnostic.severity.HINT]  = "",
        }
    },
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true
    }
});
