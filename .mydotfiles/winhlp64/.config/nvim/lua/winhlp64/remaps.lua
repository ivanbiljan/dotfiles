vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")

vim.keymap.set('n', '<C-j>', '<Esc>')
vim.keymap.set('i', '<C-j>', '<Esc>')
vim.keymap.set('v', '<C-j>', '<Esc>')
vim.keymap.set('s', '<C-j>', '<Esc>')
vim.keymap.set('x', '<C-j>', '<Esc>')
vim.keymap.set('c', '<C-j>', '<Esc>')
vim.keymap.set('o', '<C-j>', '<Esc>')
vim.keymap.set('l', '<C-j>', '<Esc>')
vim.keymap.set('t', '<C-j>', '<Esc>')

vim.keymap.set('n', '<C-k>', '<Esc>')
vim.keymap.set('i', '<C-k>', '<Esc>')
vim.keymap.set('v', '<C-k>', '<Esc>')
vim.keymap.set('s', '<C-k>', '<Esc>')
vim.keymap.set('x', '<C-k>', '<Esc>')
vim.keymap.set('c', '<C-k>', '<Esc>')
vim.keymap.set('o', '<C-k>', '<Esc>')
vim.keymap.set('l', '<C-k>', '<Esc>')
vim.keymap.set('t', '<C-k>', '<Esc>')

-- Noop arrow keys to force hjkl
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')

-- make j and k move by visual line when text is soft wrapped
vim.keymap.set("n", "j", "gjzz") -- go down one line respecting wrapped lines and center
vim.keymap.set("n", "k", "gkzz") -- go up one line respecting wrapped lines and center
vim.keymap.set("n", "G", "Gzz") -- go to line / end of file and center
vim.keymap.set("n", "#", "#zz") -- search backward for word under cursor and center
vim.keymap.set("n", "*", "*zz") -- search forward for word under cursor and center
vim.keymap.set("n", "w", "wzz") -- foward one word and center
vim.keymap.set("n", "W", "Wzz") -- foward whitespace delimited word and center
vim.keymap.set("n", "e", "ezz") -- end of word and center
vim.keymap.set("n", "E", "Ezz") -- end of whitespace delimited word and center
vim.keymap.set("n", "b", "bzz") -- back one word and center
vim.keymap.set("n", "B", "Bzz") -- back one whitespace delimited word and center
vim.keymap.set("n", "H", "Hzz") -- top of visible screen and center
vim.keymap.set("n", "L", "Lzz") -- bottom of visible screen and center
vim.keymap.set("n", "0", "0zz") -- start of line and center
vim.keymap.set("n", "$", "$zz") -- end of line and center
vim.keymap.set("n", "^", "^zz") -- first non blank char of line and center
vim.keymap.set("n", "u", "uzz") -- undo and center
vim.keymap.set("n", "(", "(zz") -- previous sentence and center
vim.keymap.set("n", ")", ")zz") -- next sentence and center
vim.keymap.set("n", "{", "{zz") -- previous para and center
vim.keymap.set("n", "}", "}zz") -- next para and center
vim.keymap.set("n", "[{", "[{zz") -- jump to opening { of current block and center
vim.keymap.set("n", "]}", "]}zz") -- jump to closing } of current block and center
vim.keymap.set("n", "gd", "gdzz") -- go to declaration and center
vim.keymap.set("n", "<C-D>", "<C-D>zz") -- move down and center
vim.keymap.set("n", "<C-U>", "<C-U>zz") -- move up and center
vim.keymap.set("n", "<C-h>", "<C-w>h") -- move between splits using Ctrl + hjkl, saving a keypress
vim.keymap.set("n", "<C-j>", "<C-w>j") -- move between splits using Ctrl + hjkl, saving a keypress
vim.keymap.set("n", "<C-k>", "<C-w>k") -- move between splits using Ctrl + hjkl, saving a keypress
vim.keymap.set("n", "<C-l>", "<C-w>l") -- move between splits using Ctrl + hjkl, saving a keypress
