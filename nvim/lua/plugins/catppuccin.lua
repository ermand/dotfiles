return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "VeryLazy",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, or mocha
      transparent_background = true,
      -- transparent_background = true,
      -- color_overrides = {
      --   all = {
      --     surface0 = "#444444",
      --     surface1 = "#666666",
      --     -- surface2 = "#a3a7bc",
      --     -- surface3 = "#a3a7bc",
      --   },
      -- },
      --   integrations = {
      --     cmp = true,
      --     gitsigns = true,
      --     harpoon = true,
      --     telescope = true,
      --     lsp_saga = true,
      --   },
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        cmp = true,
        telescope = true,
        nvimtree = false,
      },
      -- custom_highlights = function(colors)
      --   local custom_highlights_table = {
      --     CursorLine = { bg = "#3a3b3c" },
      --     ColorColumn = { bg = "#4e4e4e" },
      --     Pmenu = { bg = "#090d24" },
      --     NormalFloat = { bg = "#090d24" },
      --     Visual = { bg = "#61677d", style = { "bold" } },
      --     HighlightOnYank = { bg = "#71778d" }, -- see settings for this
      --
      --     CursorLineNr = { fg = "#e2e209" },
      --     SignColumn = { fg = "#a8a8a8" },
      --     LineNr = { fg = "#8a8a8a" },
      --     Comment = { fg = "#aaaaaa" },
      --     NonText = { fg = "#729ecb", style = { "bold" } },
      --     VertSplit = { fg = "NONE", style = { "reverse" } },
      --     StatusLine = { fg = "NONE", style = { "bold", "reverse" } },
      --     StatusLineNC = { fg = "NONE", style = { "reverse" } },
      --     MoreMsg = { fg = "SeaGreen", style = { "bold" } },
      --     MatchParen = { fg = "#87ff00", style = { "bold" } },
      --
      --     -- Search       = { fg='#c6d0f5', bg='#506373' },
      --     -- CurSearch    = { fg='#506373', bg='#c6d0f5' },
      --   }
      --   -- if vim.bo.filetype == 'elixir' then
      --   --   local my_colors_palette = require('catppuccin.palettes').get_palette(my_flavour)
      --   --   custom_highlights_table['@function'] = { fg = my_colors_palette.yellow }
      --   --   custom_highlights_table['@method']   = { fg = my_colors_palette.yellow }
      --   --   custom_highlights_table['@type']     = { fg = my_colors_palette.blue }
      --   -- end
      --   return custom_highlights_table
      -- end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
