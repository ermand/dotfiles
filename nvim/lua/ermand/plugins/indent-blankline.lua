require("indent_blankline").setup({
  filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "neo-tree",
    "lazy",
  },
  buftype_exclude = {
    "terminal",
    "NvimTree",
    "NeoTree",
  },
  show_trailing_blankline_indent = false,
  show_current_context = false,
  show_first_indent_level = true,
})
