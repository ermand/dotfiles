return {
	"alexghergh/nvim-tmux-navigation",
	config = function()
		-- require("nvim-tmux-navigation").setup()

		local keymap = vim.keymap
		local nvim_tmux_nav = require("nvim-tmux-navigation")
		keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
		keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
		keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
		keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
		keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
	end,
}
