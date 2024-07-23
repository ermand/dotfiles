vim.cmd("let g:netrw_liststyle = 3")

-- stop inserting comment on enter
vim.cmd("autocmd bufenter * set formatoptions-=cro")
vim.cmd("autocmd bufenter * setlocal formatoptions-=cro")

local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true
opt.cursorline = true

-- disable backup and swap files
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- setup tab settings
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

-- disable highlighting search results
opt.hlsearch = false

-- statusline
opt.laststatus = 2

-- search
opt.ignorecase = true
opt.smartcase = true

-- colours
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true
