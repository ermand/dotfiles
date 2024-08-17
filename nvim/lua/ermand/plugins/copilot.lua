return {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_filetypes = { xml = false, markdown = false, yaml = false, plaintext = false }
      vim.g.copilot_no_tap_map = true
      vim.g.copilot_assume_mapped = true
      vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
}
