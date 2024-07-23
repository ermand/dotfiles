-- filetype related
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit" },
	callback = function(ev)
		vim.api.nvim_set_option_value("textwidth", 72, { scope = "local" })
	end,
})

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "markdown" },
-- 	callback = function(ev)
-- 		vim.api.nvim_set_option_value("textwidth", 0, { scope = "local" })
-- 		vim.api.nvim_set_option_value("wrapmargin", 0, { scope = "local" })
-- 		vim.api.nvim_set_option_value("linebreak", 0, { scope = "local" })
-- 	end,
-- })
