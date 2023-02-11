-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)

-- -- set leader key to space
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- require("lazy").setup("plugins")

-- require("ermand.plugins-setup")
require("ermand.plugins-lazy")
require("ermand.core.options")
require("ermand.core.keymaps")
require("ermand.core.colorscheme")
-- require("ermand.plugins.comment")
-- require("ermand.plugins.neo-tree")
-- require("ermand.plugins.lualine")
-- require("ermand.plugins.telescope")
require("ermand.plugins.nvim-cmp")
-- require("ermand.plugins.lsp.mason")
require("ermand.plugins.lsp-zero")
require("ermand.plugins.lspsaga")
-- require("ermand.plugins.lsp.lspconfig")
require("ermand.plugins.lsp.null-ls")
-- require("ermand.plugins.autopairs")
-- require("ermand.plugins.treesitter")
-- require("ermand.plugins.gitsigns")
-- require("ermand.plugins.toggleterm")
-- require("ermand.plugins.copilot")
