local actions = require("telescope.actions")

-- require("telescope").load_extension("fzf")
-- require("telescope").load_extension("live_grep_args")

local keymap = vim.keymap
keymap.set(
  "n",
  "<leader>ff",
  [[<cmd>lua require('telescope.builtin').find_files()<CR>]],
  { noremap = true, silent = true, desc = "Find files" }
)
keymap.set(
  "n",
  "<leader>fF",
  [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]],
  { noremap = true, silent = true, desc = "Find all files" }
) -- luacheck: no max line length
keymap.set(
  "n",
  "<leader>fb",
  [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
  { noremap = true, silent = true, desc = "Buffers" }
)
-- keymap.set(
--   "n",
--   "<leader>fg",
--   [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]],
--   { noremap = true, silent = true, desc = "Live Grep" }
-- )
keymap.set(
  "n",
  "<leader>fh",
  [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
  { noremap = true, silent = true, desc = "History" }
)
keymap.set(
  "n",
  "<leader>fs",
  [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
  { noremap = true, silent = true, desc = "Document Symbols" }
)
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "ThePrimeagen/harpoon",
      -- config = function()
      --   require("telescope").load_extension("fzf")
      -- end,
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("notify")
      telescope.load_extension("harpoon")
    end,
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          -- preview_width = 0.6,
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        path_display = { "smart" },
        -- prompt_position = "top",
        prompt_prefix = " ",
        selection_caret = " ",
        winblend = 0,
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
        file_ignore_patterns = { ".git/", "node_modules" },
      },
      pickers = {
        buffers = {
          prompt_prefix = "﬘ ",
        },
        commands = {
          prompt_prefix = " ",
        },
        git_files = {
          prompt_prefix = " ",
          show_untracked = true,
        },
        find_files = {
          prompt_prefix = " ",
          find_command = { "rg", "--files", "--hidden" },
        },
      },
    },
  },
}
