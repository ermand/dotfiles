-- filetype related
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit" },
  callback = function(ev)
    vim.api.nvim_set_option_value("textwidth", 72, { scope = "local" })
  end,
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Set kitty terminal padding to 0 when in nvim
vim.cmd([[
  augroup kitty_mp
  autocmd!
  au VimLeave * :silent !kitty @ set-spacing padding=default margin=default
  au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0 3 0 3
  augroup END
]])

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "markdown" },
-- 	callback = function(ev)
-- 		vim.api.nvim_set_option_value("textwidth", 0, { scope = "local" })
-- 		vim.api.nvim_set_option_value("wrapmargin", 0, { scope = "local" })
-- 		vim.api.nvim_set_option_value("linebreak", 0, { scope = "local" })
-- 	end,
-- })
