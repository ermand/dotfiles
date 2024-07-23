return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		require("nvim-ts-autotag").setup()

		treesitter.setup({
			-- enable syntax highlighiting
			highlight = {
				enable = true,
			},

			-- enable indentation
			indent = { enable = true },

			-- ensure these language parsers are installed
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"c",
				"rust",
				"go",
				"gomod",
				"make",
				"regex",
				"scss",
				"sql",
				"svelte",
				"vue",
				"terraform",
				"toml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		local lspDiagnosticsVisible = false

		vim.diagnostic.config({
			virtual_text = lspDiagnosticsVisible,
			underline = lspDiagnosticsVisible,
		})

		vim.keymap.set("n", "<leader>lx", function()
			lspDiagnosticsVisible = not lspDiagnosticsVisible
			vim.diagnostic.config({
				virtual_text = lspDiagnosticsVisible,
				underline = lspDiagnosticsVisible,
			})
		end)
	end,
}
