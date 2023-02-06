local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({

  "nvim-lua/plenary.nvim", -- lua functions that many plugins use

  -- use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
  -- use("folke/tokyonight.nvim")
  { "catppuccin/nvim", name = "catppuccin" },
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation

  "szw/vim-maximizer", -- maximizes and restores current window

  -- essential plugins
  "tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
  "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

  -- commenting with gc
  {
    "numToStr/Comment.nvim",

    config = function()
      require("ermand.plugins.comment")
    end,
  },

  -- file explorer
  -- use("nvim-tree/nvim-tree.lua")
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      -- "nvim-lua/plenary.nvim",
      -- "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("ermand.plugins.neo-tree")
    end,
  },
  -- vs-code like icons
  "kyazdani42/nvim-web-devicons",

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("ermand.plugins.lualine")
    end,
  },

  -- fuzzy finding w/ telescope
  -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      -- { 'nvim-lua/plenary.nvim' },
      -- { 'kyazdani42/nvim-web-devicons' },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require("ermand.plugins.telescope")
    end,
  }, -- fuzzy finder

  -- autocompletion
  -- use("hrsh7th/nvim-cmp") -- completion plugin
  -- use("hrsh7th/cmp-buffer") -- source for text in buffer
  -- use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  -- use("L3MON4D3/LuaSnip") -- snippet engine
  -- use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  -- use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  -- use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  -- use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  -- use("neovim/nvim-lspconfig") -- easily configure language servers
  -- use("hrsh7th/cmp-nvim-lsp") -- for autocompletion

  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletio
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  },
  { "glepnir/lspsaga.nvim", branch = "main" }, -- enhanced lsp uis
  "jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
  {
    "onsails/lspkind.nvim",
    build = function()
      require("ermand.plugins.lspkind")
    end,
  }, -- vs-code like icons for autocompletion

  -- formatting & linting
  "jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
  "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    dependencies = {
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("ermand.plugins.treesitter")
    end,
  },

  -- auto closing
  {
    "windwp/nvim-autopairs",
    config = function()
      require("ermand.plugins.autopairs")
    end,
  }, -- autoclose parens, brackets, quotes, etc...
  -- { "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- autoclose tags

  -- git integration
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("ermand.plugins.gitsigns")
    end,
  }, -- show line modifications on left hand side

  -- integrated terminal
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("ermand.plugins.toggleterm")
    end,
  }, -- toggle terminal

  -- copilot
  {
    "github/copilot.vim",
    config = function()
      require("ermand.plugins.copilot")
    end,
  },

  -- editorconfig
  "gpanders/editorconfig.nvim",
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
    config = function()
      require("ermand.plugins.indent-blankline")
    end,
  },
})
