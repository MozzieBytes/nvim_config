-- global
vim.g.mapleader = " " -- Setting <leader> to Space
--vim.opt.clipboard = 'xclip'
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a" -- enable mouse support

-- Tab
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- UI Config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
vim.opt.showmode = true -- Show vim mode
vim.opt.colorcolumn = "81" -- Line width indicator
vim.opt.wrap = false -- Line wrapping

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase character is entered
