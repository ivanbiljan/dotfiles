local signs = {
    [vim.diagnostic.severity.ERROR] = " ",
    [vim.diagnostic.severity.WARN] = " ",
    [vim.diagnostic.severity.HINT] = "󰠠 ",
    [vim.diagnostic.severity.INFO] = " ",
}

vim.diagnostic.config({
    signs = signs,
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
