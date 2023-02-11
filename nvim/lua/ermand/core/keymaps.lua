-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness
---------------------
-- General Keymaps
---------------------
keymap.set("n", "<leader>Q", ":bufdo bdelete<CR>")

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- Allow gf to open non-existent files
keymap.set("", "gf", ":edit <cfile><CR>")

-- Reselect visual selection after indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap.set("v", "y", "myy`y")
keymap.set("v", "Y", "myY`y")

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Paste replace visual selection without copying it
keymap.set("v", "p", '"_dP')

-- Easy insertion of a trailing ; or , from insert mode
keymap.set("i", ";;", "<Esc>A;<Esc>")
keymap.set("i", ",,", "<Esc>A,<Esc>")

-- Open the current file in the default program (on Mac this should just be just `open`)
keymap.set("n", "<leader>x", ":!xdg-open %<cr><cr>")

-- Disable annoying command line thing
keymap.set("n", "q:", ":q<CR>")

-- Move text up and down
keymap.set("i", "<A-k>", "<Esc>:move .-2<CR>==gi")
keymap.set("i", "<A-j>", "<Esc>:move .+1<CR>==gi")
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv")

--- Existing previously
-- move highlighted text
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move lines
keymap.set("n", "J", "mzJ`z")

-- keep cursor centered
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- paste from clipboard without copying into register
keymap.set("x", "<leader>p", '"_dP')

-- delete to avoid copying into register
keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

-- unbind capital Q
keymap.set("n", "Q", "<nop>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- buffers
keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>") --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>") --  go to previous tab

-- Resize with arrows
keymap.set("n", "<S-Up>", ":resize -2<CR>")
keymap.set("n", "<S-Down>", ":resize +2<CR>")
keymap.set("n", "<S-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<S-Right>", ":vertical resize +2<CR>")

-- jump between projects in tmux
-- keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

----------------------
-- Plugin Keybinds
---------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- neo-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>")
keymap.set("n", "<leader>w", "<cmd>Neotree focus<cr>")

-- telescope
-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
-- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
-- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
-- keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
-- keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- comments
keymap.set("n", "<C-/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
keymap.set("v", "<C-/>", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
keymap.set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
keymap.set("v", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
keymap.set("n", "<C-c>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
keymap.set("v", "<C-c>", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- toggleterm
keymap.set("n", "<leader>\\", "<cmd>ToggleTerm<CR>")
keymap.set("t", "<leader>\\", "<cmd>ToggleTerm<CR>")
keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>")
