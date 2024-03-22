local actions = require("telescope.actions")

-- require("telescope").load_extension("fzf")
-- require("telescope").load_extension("live_grep_args")

-- local keymap = vim.keymap
-- keymap.set(
--   "n",
--   "<leader>ff",
--   [[<cmd>lua require('telescope.builtin').find_files()<CR>]],
--   { noremap = true, silent = true, desc = "Find files" }
-- )
-- keymap.set(
--   "n",
--   "<leader>fF",
--   [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]],
--   { noremap = true, silent = true, desc = "Find all files" }
-- ) -- luacheck: no max line length
-- keymap.set(
--   "n",
--   "<leader>fb",
--   [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
--   { noremap = true, silent = true, desc = "Buffers" }
-- )
-- -- keymap.set(
-- --   "n",
-- --   "<leader>fg",
-- --   [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]],
-- --   { noremap = true, silent = true, desc = "Live Grep" }
-- -- )
-- keymap.set(
--   "n",
--   "<leader>fh",
--   [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
--   { noremap = true, silent = true, desc = "History" }
-- )
-- keymap.set(
--   "n",
--   "<leader>fs",
--   [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
--   { noremap = true, silent = true, desc = "Document Symbols" }
-- )
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "ThePrimeagen/harpoon",

      { -- If encountering errors, see telescope-fzf-native README for install instructions
        "nvim-telescope/telescope-fzf-native.nvim",

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = "make",

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
      -- config = function()
      --   require("telescope").load_extension("fzf")
      -- end,
    },
    config = function(_, opts)
      -- local telescope = require("telescope")
      -- telescope.setup(opts)
      -- telescope.load_extension("fzf")
      -- telescope.load_extension("notify")
      -- telescope.load_extension("harpoon")

      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of help_tags options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require("telescope").setup({
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })

      -- Enable telescope extensions, if they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      -- See `:help telescope.builtin`
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
      vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
      vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
      vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
      vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
      vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "[/] Fuzzily search in current buffer" })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set("n", "<leader>s/", function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end, { desc = "[S]earch [/] in Open Files" })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set("n", "<leader>sn", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "[S]earch [N]eovim files" })
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
