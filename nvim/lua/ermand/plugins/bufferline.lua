require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    always_show_bufferline = false,
    -- offsets = {
    --   { filetype = "NvimTree", text = "", padding = 1 },
    --   { filetype = "neo-tree", text = "Explorer", padding = 1 },
    --   { filetype = "Outline", text = "", padding = 1 },
    -- },
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    separator_style = "thin",

    indicator = {
      icon = " ",
    },
    show_close_icon = false,
    -- tab_size = 0,
    -- max_name_length = 25,
    offsets = {
      {
        filetype = "NvimTree",
        text = "  Files",
        highlight = "StatusLine",
        text_align = "left",
      },
      { filetype = "neo-tree", text = "  Files", text_align = "left", highlight = "Directory", padding = 1 },
      { filetype = "Outline", text = "", padding = 1 },
    },
    -- separator_style = "slant",
    modified_icon = "",
    custom_areas = {
      left = function()
        return {
          { text = "    ", fg = "#8fff6d" },
        }
      end,
    },
  },
  highlights = {
    fill = {
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    background = {
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    tab = {
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    tab_close = {
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    close_button = {
      bg = { attribute = "bg", highlight = "StatusLine" },
      fg = { attribute = "fg", highlight = "StatusLineNonText" },
    },
    close_button_visible = {
      bg = { attribute = "bg", highlight = "StatusLine" },
      fg = { attribute = "fg", highlight = "StatusLineNonText" },
    },
    close_button_selected = {
      fg = { attribute = "fg", highlight = "StatusLineNonText" },
    },
    buffer_visible = {
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    modified = {
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    modified_visible = {
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    duplicate = {
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    duplicate_visible = {
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    separator = {
      fg = { attribute = "bg", highlight = "StatusLine" },
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    separator_selected = {
      fg = { attribute = "bg", highlight = "StatusLine" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    separator_visible = {
      fg = { attribute = "bg", highlight = "StatusLine" },
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
  },
})

local keymap = vim.keymap
keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
