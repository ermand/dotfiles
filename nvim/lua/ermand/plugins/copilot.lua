vim.g.copilot_filetypes = { xml = false, markdown = false, yaml = false, plaintext = false }
vim.g.copilot_no_tap_map = true
vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
