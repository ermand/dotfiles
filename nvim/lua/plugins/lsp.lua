return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "simrat39/rust-tools.nvim",
    },
    opts = {
      servers = {
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        intelephense = {},
        gopls = {},
        astro = {},
        volar = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "vue",
          },
        },
        rust_analyzer = {},
      },
      setup = {
        rust_analyzer = function(_, opts)
          require("rust-tools").setup({ server = opts })
          return true
        end,
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "dnlhc/glance.nvim",
    config = function()
      require("glance").setup({
        theme = {
          enable = true,
          mode = "auto",
        },
        border = {
          enable = false,
          top_char = "─",
          bottom_char = "─",
        },
      })
    end,
    keys = {
      { "gD", "<CMD>Glance definitions<CR>", desc = "Glance definitions" },
      { "gR", "<CMD>Glance references<CR>", desc = "Glance references" },
      { "gY", "<CMD>Glance type_definitions<CR>", desc = "Glance type_definitions" },
      { "gM", "<CMD>Glance implementations<CR>", desc = "Glance implementations" },
    },
  },
}
