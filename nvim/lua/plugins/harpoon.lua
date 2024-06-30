return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local harpoon = require("harpoon")

    -- keymap.set('n', '<leader>hm', "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = 'Mark file with harpoon' })
    -- keymap.set('n', '<leader>hn', "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = 'Go to next harpoon mark' })
    -- keymap.set('n', '<leader>hp', "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = 'Go to previous harpoon mark' })
    --
    -- -- keymap.set('n', "<leader>'", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = 'Add to Harpoon' })
    -- keymap.set('n', '<leader>h0', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = 'Show Harpoon' })
    -- keymap.set('n', '<leader>h1', "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = 'Harpoon Buffer 1' })
    -- keymap.set('n', '<leader>h2', "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = 'Harpoon Buffer 2' })
    -- keymap.set('n', '<leader>h3', "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = 'Harpoon Buffer 3' })
    -- keymap.set('n', '<leader>h4', "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = 'Harpoon Buffer 4' })
    -- keymap.set('n', '<leader>h5', "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", { desc = 'Harpoon Buffer 5' })
    -- keymap.set('n', '<leader>h6', "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", { desc = 'Harpoon Buffer 6' })
    -- keymap.set('n', '<leader>h7', "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", { desc = 'Harpoon Buffer 7' })
    -- keymap.set('n', '<leader>h8', "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", { desc = 'Harpoon Buffer 8' })
    -- keymap.set('n', '<leader>h9', "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", { desc = 'Harpoon Buffer 9' })

    -- Version 2
    keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end)
    keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    keymap.set("n", "<leader>h1", function()
      harpoon:list():select(1)
    end)
    keymap.set("n", "<leader>h2", function()
      harpoon:list():select(2)
    end)
    keymap.set("n", "<leader>h3", function()
      harpoon:list():select(3)
    end)
    keymap.set("n", "<leader>h4", function()
      harpoon:list():select(4)
    end)
    keymap.set("n", "<leader>h5", function()
      harpoon:list():select(5)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    keymap.set("n", "<leader>p", function()
      harpoon:list():prev()
    end)
    keymap.set("n", "<leader>n", function()
      harpoon:list():next()
    end)
  end,
}
-- return {
--   "ThePrimeagen/harpoon",
--   dependencies = "nvim-lua/plenary.nvim",
--   opts = {
--     global_settings = { mark_branch = true },
--     width = vim.api.nvim_win_get_width(0) - 4,
--   },
-- }
