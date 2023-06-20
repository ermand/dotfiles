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
