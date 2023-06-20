return {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      border = "double",
      icons = {
        package_installed = "﫟",
        package_pending = "﫠",
        package_uninstalled = "",
      },
    },
    ensure_installed = {
      -- 﫟 black
      -- 﫟 css-lsp cssls
      -- 﫟 emmet-ls emmet_ls
      -- 﫟 eslint-lsp eslint
      -- 﫟 eslint_d
      -- 﫟 flake8
      -- 﫟 gopls
      -- 﫟 html-lsp html
      -- 﫟 intelephense
      -- 﫟 json-lsp jsonls
      -- 﫟 lua-language-server lua_ls
      -- 﫟 phpactor
      -- 﫟 prettierd
      -- 﫟 pyright
      -- 﫟 shellcheck
      -- 﫟 shfmt
      -- 﫟 stylua
      -- 﫟 tailwindcss-language-server tailwindcss
      -- 﫟 typescript-language-server tsserver
      -- 﫟 vue-language-server volar

      -- "actionlint",
      -- "ansible-language-server",
      -- "ansible-lint",
      -- "antlers-language-server",
      "black",
      "bash-language-server",
      "blade-formatter",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "dot-language-server",
      "eslint_d",
      "flake8",
      "hadolint",
      "html-lsp",
      "intelephense",
      "phpactor",
      "nginx-language-server",
      "php-debug-adapter",
      "phpstan",
      "pint",
      "prettierd",
      "pyright",
      "rustywind",
      -- "shellcheck",
      "shfmt",
      "stylua",
      "tailwindcss-language-server",
    },
  },
}
