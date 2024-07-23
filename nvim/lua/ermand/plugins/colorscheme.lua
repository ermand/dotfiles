return {
	"catppuccin/nvim",
	name = "catppuccin",
	tag = "v1.7.0",
	enabled = true,
	priority = 1000,
	config = function()
		vim.opt.termguicolors = true

		local catppuccin = require("catppuccin")

		catppuccin.setup({
			flavour = "mocha",
			term_colors = true,
			styles = {
				conditionals = {},
				functions = { "italic" },
				types = { "bold" },
			},
			color_overrides = {
				mocha = {
					base = "#171717", -- background
					surface2 = "#9A9A9A", -- comments
					text = "#F6F6F6",
				},
			},
			highlight_overrides = {
				mocha = function(C)
					return {
						NvimTreeNormal = { bg = C.none },
						CmpBorder = { fg = C.surface2 },
						Pmenu = { bg = C.none },
						NormalFloat = { bg = C.none },
						TelescopeBorder = { link = "FloatBorder" },
					}
				end,
			},
			integrations = {
				barbar = true,
				cmp = true,
				gitsigns = true,
				native_lsp = { enabled = true },
				nvimtree = true,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}

-- return {
-- 	"AlexvZyl/nordic.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		local palette = require("nordic.colors")
--
-- 		require("nordic").setup({
-- 			transparent_bg = true,
-- 			telescope = { style = "classic" },
-- 			override = {
-- 				CursorLine = {
-- 					bg = "#2e3440",
-- 					bold = true,
-- 				},
-- 			},
-- 		})
--
-- 		vim.cmd("colorscheme nordic")
-- 		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1e2022" })
-- 	end,
-- }
