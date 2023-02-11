-- -- import telescope plugin safely
-- local telescope_setup, telescope = pcall(require, "telescope")
-- if not telescope_setup then
-- 	return
-- end
--
-- -- import telescope actions safely
-- local actions_setup, actions = pcall(require, "telescope.actions")
-- if not actions_setup then
-- 	return
-- end
--
-- -- configure telescope
-- telescope.setup({
-- 	-- configure custom mappings
-- 	defaults = {
-- 		mappings = {
-- 			i = {
-- 				["<C-k>"] = actions.move_selection_previous, -- move to prev result
-- 				["<C-j>"] = actions.move_selection_next, -- move to next result
-- 				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
-- 			},
-- 		},
-- 	},
-- })
--
-- telescope.load_extension("fzf")

local telescope = require("telescope")
local actions = require("telescope.actions")

-- vim.cmd([[
--   highlight link TelescopePromptTitle PMenuSel
--   highlight link TelescopePreviewTitle PMenuSel
--   highlight link TelescopePromptNormal NormalFloat
--   highlight link TelescopePromptBorder FloatBorder
--   highlight link TelescopeNormal CursorLine
--   highlight link TelescopeBorder CursorLineBg
-- ]])

telescope.setup({
  defaults = {
    path_display = { truncate = 1 },
    prompt_prefix = "   ",
    selection_caret = "  ",
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-h>"] = actions.cycle_history_next,
        ["<C-l>"] = actions.cycle_history_prev,
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
    file_ignore_patterns = { ".git/" },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = "History",
    },
    lsp_references = {
      previewer = false,
    },
  },
})

-- require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")

local keymap = vim.keymap
keymap.set("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
keymap.set(
  "n",
  "<leader>fF",
  [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]]
) -- luacheck: no max line length
keymap.set("n", "<leader>fb", [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
keymap.set("n", "<leader>fg", [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
keymap.set("n", "<leader>fh", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
keymap.set("n", "<leader>fs", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
