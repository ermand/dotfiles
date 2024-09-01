return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-frecency.nvim" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        -- borderchars = { "", "", "", "", "", "", "", "" },
        path_display = { "smart" },
        mappings = {
          i = {
            ["C-k"] = actions.move_selection_previous,
            ["C-j"] = actions.move_selection_next,
            ["C-q"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        frecency = {
          show_scores = true,
          show_unindexed = true,
          show_filter_column = false,
          ignore_patterns = { "*.git/*", "*/tmp/*" },
          workspaces = {
            ["CWD"] = vim.fn.expand("%:p:h"),
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("frecency")

    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
    -- vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
    vim.keymap.set("n", "<leader>fr", "<cmd>Telescope frecency workspace=CWD<CR>", { desc = "Fuzzy find recent files" })
    vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
    vim.keymap.set(
      "n",
      "<leader>fc",
      "<cmd>Telescope grep_string<CR>",
      { desc = "Find string under the cursor in cwd" }
    )

    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find toods" })
  end,
}
