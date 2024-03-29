local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
  return
end
neotree.setup({
  close_if_last_window = true,
  enable_diagnostics = false,
  source_selector = {
    winbar = false,
    statusline = false,
    content_layout = "center",
    tab_labels = {},
  },
  default_component_configs = {
    indent = {
      padding = 0,
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "ﰊ",
      -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
      -- then these will never be used.
      default = "*",
      highlight = "NeoTreeFileIcon",
    },
    git_status = {
      symbols = {
        added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = "✖", -- this can only be used in the git_status source
        renamed = "", -- this can only be used in the git_status source
        -- Status type
        untracked = "★",
        ignored = "",
        unstaged = "",
        staged = "",
        conflict = "",
      },
    },
  },
  window = {
    width = 50,
    mappings = {
      ["o"] = "open",
    },
    position = "right",
  },
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(_)
        vim.opt_local.signcolumn = "auto"
      end,
    },
  },
})
