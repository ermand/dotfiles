-- set colorscheme to nightfly with protected call
-- in case it isn't installed

-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true
--
-- vim.g.tokyonight_colors = {
-- 	fg = "#839496",
-- 	fg_dark = "#586e75",
-- 	fg_gutter = "#073642",
-- 	bg_highlight = "#002b36",
-- 	comment = "#586e75",
-- 	blue = "#268bd2",
--
-- 	cyan = "#2aa198",
-- 	blue1 = "#2ac3de",
-- 	blue2 = "#0db9d7",
-- 	blue5 = "#89ddff",
-- 	blue6 = "#B4F9F8",
--
-- 	yellow = "#b58900",
-- 	orange = "#cb4b16",
-- 	magenta = "#d33682",
-- 	purple = "#6c71c4",
-- }
--
local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
