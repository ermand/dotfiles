local opt = vim.opt -- for conciseness

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

opt.wildmode = "longest:full,full" -- tab completion
opt.completeopt = "menuone,longest,preview" -- completion options

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = true -- highlight search results
opt.incsearch = true -- show search results as you type

-- cursor line
-- opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.scrolloff = 8 -- keep 8 lines above and below cursor when scrolling
opt.isfname:append("@-@") -- allow @ in filenames
opt.colorcolumn = "120" -- show a vertical line at column 80
-- vim.opt.guicursor = ""

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
opt.splitkeep = "cursor"

opt.iskeyword:append("-") -- consider string-string as whole word

-- swap files
opt.swapfile = false

-- Persist undo tree across neovim sessions
opt.undofile = true

-- update time
opt.updatetime = 50 -- set update time to 50ms

vim.opt.title = true
vim.opt.autochdir = true
vim.opt.smartindent = true
vim.opt.backup = false
-- vim.opt.showcmd = true
-- vim.opt.cmdheight = 0
-- vim.opt.laststatus = 0

vim.opt.inccommand = "split"
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.path:append("**")
vim.opt.wildignore:append("*/node_modules/*")
vim.opt.formatoptions:append({ "r" })
