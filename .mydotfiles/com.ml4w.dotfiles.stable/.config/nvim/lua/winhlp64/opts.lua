# https://neovim.io/doc/user/quickref/#option-list
vim.opt.showmatch = false		    -- when a bracket is inserted, briefly jump to the matching one 
vim.opt.ignorecase = true		    -- ignore case sensitivy in search patterns
vim.opt.mouse = "a"		    	    -- enable mouse in Visual mode
vim.opt.hlsearch = true			    -- highlight search 
vim.opt.incsearch = true		    -- incremental search
vim.opt.tabstop = 4			        -- number of columns occupied by tab
vim.opt.softtabstop = 4			    -- see multiple spaces as tabstops to <BS> does the right thing
vim.opt.expandtab = true		    -- convers tabs to whitespace
vim.opt.shiftwidth = 4			    -- width for autoindents
vim.opt.autoindent = true	    	-- indent a new line the same amount as the line just typed
vim.opt.number = true			    -- show line numbers
vim.opt.relativenumber = true		-- show relative line numbers
vim.opt.wildmode = "longest,list"	-- bash-like tab completions. Complete to longest common substring or if multiple matches are found list all
vim.opt.syntax = "on"			    -- syntax higlighting
vim.opt.clipboard = "unnamedplus"	-- system clipboard
vim.opt.ttyfast = true			    -- speed up scrolling in vim

vim.opt.foldenable = false
vim.opt.foldmethod = "manual"
vim.opt.foldlevelstart = 120
vim.opt.wrap = false

vim.opt.wildignore = ".hg,.snv,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site"
