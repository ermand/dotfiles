-- return {
--   "catppuccin/nvim",
--   lazy = false,
--   priority = 150,
--   name = "catppuccin",
--   config = function()
--     require("catppuccin").setup({
--       flavour = "mocha",
--       -- flavour = "latte",
--       styles = {
--         comments = { "italic" },
--         conditionals = { "italic" },
--         loops = { "bold" },
--         functions = { "bold" },
--         keywords = { "bold" },
--         strings = {},
--         variables = {},
--         numbers = { "bold" },
--         booleans = { "bold" },
--         properties = {},
--         types = { "bold" },
--         operators = {},
--       },
--       transparent_background = true,
--       show_end_of_buffer = false,
--       custom_highlights = function(colors)
--         return {
--           NormalFloat = { bg = colors.crust },
--           FloatBorder = { bg = colors.crust, fg = colors.crust },
--           VertSplit = { bg = colors.base, fg = colors.surface0 },
--           CursorLineNr = { fg = colors.mauve, style = { "bold" } },
--           Pmenu = { bg = colors.crust, fg = "" },
--           PmenuSel = { bg = colors.surface0, fg = "" },
--           TelescopeSelection = { bg = colors.surface0 },
--           TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },
--           TelescopePromptPrefix = { bg = colors.surface0 },
--           TelescopePromptNormal = { bg = colors.surface0 },
--           TelescopeResultsNormal = { bg = colors.mantle },
--           TelescopePreviewNormal = { bg = colors.crust },
--           TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
--           TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
--           TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
--           TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
--           TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
--           TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
--           IndentBlanklineChar = { fg = colors.surface0 },
--           IndentBlanklineContextChar = { fg = colors.surface2 },
--           GitSignsChange = { fg = colors.peach },
--           NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
--           NvimTreeExecFile = { fg = colors.text },
--         }
--       end,
--     })
--
--     vim.api.nvim_command("colorscheme catppuccin")
--   end,
-- }

return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
  },
}
