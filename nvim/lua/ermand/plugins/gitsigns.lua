-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

-- configure/enable gitsigns
gitsigns.setup()

local keymap = vim.keymap -- for conciseness

keymap.set("n", "]h", ":Gitsigns next_hunk<CR>")
keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>")
keymap.set("n", "gs", ":Gitsigns stage_hunk<CR>")
keymap.set("n", "gS", ":Gitsigns undo_stage_hunk<CR>")
keymap.set("n", "gp", ":Gitsigns preview_hunk<CR>")
keymap.set("n", "gb", ":Gitsigns blame_line<CR>")
