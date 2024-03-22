-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_command("autocmd VimResized * :wincmd =")

-- if a file is a .env or envrc file, set the filetype to sh
vim.api.nvim_create_autocmd("BufRead", {
  pattern = { "*.env", "*. envrc" },
  callback = function()
    vim.filetype.add({
      filename = {
        [".env"] = "sh",
        [".envrc"] = "sh",
        ["*.env"] = "sh",
        ["*.envrc"] = "sh",
      },
    })
  end,
})

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})
