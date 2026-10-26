-- https://neovim.io/doc/user/quickref/#option-list
local opt = vim.opt


-- Appearance
opt.termguicolors  = true     -- 24-bit RGB colors. Should be enabled by default if the host supports it
opt.number         = true     -- show the absolute number of the current line
opt.relativenumber = true     -- other lines show their distance from the cursor
opt.signcolumn     = "yes"    -- always reserve the gutter for git/LSP signs so text doesn't shift
opt.scrolloff      = 8        -- keep 8 lines visible above/below the cursor when scrolling
opt.wrap           = false    -- long lines run off-screen instead of wrapping onto the next row
opt.showmatch      = false    -- don't jump to the matching bracket when typing a closing one
opt.mouse          = "a"      -- enable mouse in all modes

-- Indentation
opt.tabstop     = 4           -- a tab character is displayed as 4 columns
opt.softtabstop = 4           -- <Tab>/<BS> insert/delete 4 columns at a time in insert mode
opt.shiftwidth  = 4           -- columns used by >>, << and auto-indent
opt.expandtab   = true        -- insert spaces instead of tab characters (:retab converts existing ones)
opt.autoindent  = true        -- new lines keep the indentation of the previous line

-- Search
opt.ignorecase = true         -- searches are case-insensitive...
opt.smartcase  = true         -- ...unless the pattern contains an uppercase letter
opt.hlsearch   = true         -- highlight all matches until :nohlsearch or a new search
opt.incsearch  = true         -- show matches live while typing the pattern

-- Folding
opt.foldenable = false        -- files open with all folds expanded (zi toggles folding)
opt.foldmethod = "manual"     -- folds are created by hand with zf; nothing is folded automatically
opt.foldlevel  = 99           -- when folding is enabled, folds start open

-- Backup and swap files
opt.swapfile = false          -- no .swp files (lose crash recovery, avoid clutter and prompts)
opt.backup   = false          -- no file~ backup copy when saving

-- Command-line completion
opt.wildmode   = "longest,list"   -- first <Tab> completes the common prefix, second lists all matches
opt.wildignore = {                -- skipped by file-name completion and wildcard expansion (:e, :find)
    ".hg", ".svn", "*~", "*.swp", "*.o",
    "*.png", "*.jpg", "*.gif", "*.min.js",
    "vendor", "dist", "_site",
}

-- System integration
opt.clipboard = "unnamedplus" -- y/p use the system clipboard
