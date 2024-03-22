return {
  "akinsho/nvim-bufferline.lua",
  event = "VeryLazy",
  keys = {
    { "Tab", ":BufferLineCycleNext<CR>" },
    { "S-Tab", ":BufferLineCyclePrev<CR>" },
  },
  opts = {
    options = {
      -- mode = "tabs",
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },
}
