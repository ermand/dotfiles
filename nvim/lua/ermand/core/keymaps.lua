vim.g.mapleader = " "

local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- Insert UUID
keymap.set("i", "<c-u>", "<c-r>=trim(system('uuidgen | tr A-Z a-z'))<cr>", { desc = "Insert UUID at cursor" })

-- Copy current file path
vim.api.nvim_set_keymap(
  "n",
  "<leader>cp",
  [[:lua vim.fn.setreg('+', vim.fn.expand('%:p'))<CR>]],
  { noremap = true, silent = true }
)

---------------------
-- General Keymaps
---------------------
-- keymap.set("n", "QA", ":qa<enter>", { noremap = false })
keymap.set("n", "QQ", ":q!<enter>", { noremap = false })
keymap.set("n", "WW", ":w!<enter>", { noremap = false })

-- Use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap.set("v", "y", "myy`y")
keymap.set("v", "Y", "myY`y")

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Paste replace visual selection without copying it
keymap.set("v", "p", '"_dP')

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- paste from clipboard without copying into register
keymap.set("x", "<leader>p", '"_dP')

-- delete to avoid copying into register
keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

-- Easy insertion of a trailing ; or , from insert mode
keymap.set("i", ";;", "<Esc>A;<Esc>")
keymap.set("i", ",,", "<Esc>A,<Esc>")

-- Disable annoying command line thing
keymap.set("n", "q:", ":q<CR>")

-- keep cursor centered
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Search
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Splits
keymap.set("n", "<leader>sv", "<c-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<c-w>s", { desc = "Split window horizontally" })

-- Move lines
keymap.set("n", "<a-down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap.set("n", "<a-up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap.set("i", "<a-down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap.set("i", "<a-up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap.set("v", "<a-down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "<a-up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Multi line scrolling
-- keymap.set("n", "<s-up>", "2k", { desc = "" })
-- keymap.set("n", "<s-down>", "2j", { desc = "" })
-- keymap.set("n", "<s-c-up>", "5k", { desc = "" })
-- keymap.set("n", "<s-c-down>", "5j", { desc = "" })

-- Save file
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- unbind capital Q
keymap.set("n", "Q", "<nop>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- Resize with arrows
keymap.set("n", "<S-Up>", ":resize -2<CR>")
keymap.set("n", "<S-Down>", ":resize +2<CR>")
keymap.set("n", "<S-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<S-Right>", ":vertical resize +2<CR>")
keymap.set("n", "<A-S-l>", ":vertical resize -2<CR>")
keymap.set("n", "<A-S-h>", ":vertical resize +2<CR>")

-- refactoring.nvim
-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap(
  "v",
  "<leader>re",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
  { noremap = true, silent = true, expr = false, desc = "Extract Function" }
)
vim.api.nvim_set_keymap(
  "v",
  "<leader>rf",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
  { noremap = true, silent = true, expr = false, desc = "Extract Function to File" }
)
vim.api.nvim_set_keymap(
  "v",
  "<leader>rv",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
  { noremap = true, silent = true, expr = false, desc = "Extract Variable" }
)
vim.api.nvim_set_keymap(
  "v",
  "<leader>ri",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
  { noremap = true, silent = true, expr = false, desc = "Inline Variable" }
)
