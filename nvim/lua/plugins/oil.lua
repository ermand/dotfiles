return {
  {
    "stevearc/oil.nvim",
    opts = {},
    keys = {
      {
        "-",
        function()
          require("oil").open()
        end,
        desc = "Open parent directory",
      },

      {
        "<space>-",
        function()
          require("oil").toggle_float()
        end,
        desc = "Open parent directory",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- config = function()
    --   -- Open parent directory in floating window
    --   vim.keymap.set("n", "<space>-", require("oil").toggle_float)
    -- end,
  },
}
