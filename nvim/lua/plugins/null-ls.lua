vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format({ async = true })
end, {})

return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          -- nls.builtins.formatting.prettierd,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.black,
          nls.builtins.diagnostics.flake8,
          nls.builtins.diagnostics.eslint_d.with({
            condition = function(utils)
              return utils.root_has_file({ ".eslintrc.js" })
            end,
          }),
          nls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { "NvimTree" } }),
          -- nls.builtins.diagnostics.phpstan,
          nls.builtins.formatting.eslint_d.with({
            condition = function(utils)
              return utils.root_has_file({ ".eslintrc.js" })
            end,
          }),
          nls.builtins.formatting.prettierd,
        },
      }
    end,
  },
}
