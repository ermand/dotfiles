local colors = {
  bg = "#202328",
  fg = "#111422",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local config = {
  options = {
    -- theme = "github_dark_default",
    -- Disable sections and component separators
    component_separators = { left = "»", right = "«" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "netrw", "carbon.explorer" },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left({
  function()
    return "▊"
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color_fg = {
      n = colors.blue,
      i = colors.magenta,
      v = colors.red,
      V = colors.red,
      s = colors.orange,
      S = colors.orange,
      R = colors.violet,
      Rv = colors.violet,
      r = colors.cyan,
      rm = colors.cyan,
    }

    return { fg = mode_color_fg[vim.fn.mode()], gui = "bold" }
  end,
  padding = { right = 1 }, -- We don't need space before this
})

ins_left({
  function()
    return "♥"
  end,
  color = { fg = colors.red, gui = "bold" },
})

ins_left({
  -- Lsp server name .
  function()
    local msg = "lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = "",
  color = { fg = "#ffffff", gui = "bold" },
  separator = "",
})

ins_left({
  function()
    return "%="
  end,
  separator = "",
})

ins_left({
  "diagnostics",
  sources = { "nvim_lsp" },
  symbols = { error = " ", warn = " ", info = " " },
  separator = "",
})

ins_right({
  "filetype",
  fmt = string.lower,
  icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.blue, gui = "bold" },
})

ins_right({
  "branch",
  icon = "",
  color = { fg = colors.yellow, gui = "bold" },
})

ins_right({
  function()
    return "▊"
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color_fg = {
      n = colors.blue,
      i = colors.magenta,
      v = colors.red,
      V = colors.red,
      s = colors.orange,
      S = colors.orange,
      R = colors.violet,
      Rv = colors.violet,
      r = colors.cyan,
      rm = colors.cyan,
    }

    return { fg = mode_color_fg[vim.fn.mode()], gui = "bold" }
  end,
  padding = { left = 1 }, -- We don't need space before this
})

local new_config = {
  options = {
    icons_enabled = true,
    theme = "onedark",
    component_separators = "|",
    section_separators = "",
  },
  sections = {
    lualine_a = {
      {
        "buffers",
      },
    },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  opts = function(plugin)
    if plugin.override then
      require("lazyvim.util").deprecate("lualine.override", "lualine.opts")
    end

    -- local hide_in_width = function()
    --   return vim.fn.winwidth(0) > 80
    -- end

    local icons = require("lazyvim.config").icons

    local filetype = { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } }
    local filename = { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } }

    local navic = {
      function()
        return require("nvim-navic").get_location()
      end,
      cond = function()
        return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
      end,
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn", "info", "hint" },
      symbols = {
        error = icons.diagnostics.Error,
        hint = icons.diagnostics.Hint,
        info = icons.diagnostics.Info,
        warn = icons.diagnostics.Warn,
      },
      colored = true,
      update_in_insert = false,
      always_visible = false,
    }

    local diff = {
      "diff",
      colored = true,
      symbols = {
        added = icons.git.added,
        untracked = icons.git.added,
        modified = icons.git.modified,
        removed = icons.git.removed,
      },
      -- cond = hide_in_width,
    }

    local function fg(name)
      return function()
        ---@type {foreground?:number}?
        local hl = vim.api.nvim_get_hl_by_name(name, true)
        return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
      end
    end

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { diff, diagnostics, filetype, filename, navic },
        lualine_x = {
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = fg("Statement")
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = fg("Constant") ,
            },
          { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
        },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "nvim-tree" },
    }
  end,
}
