local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end

lsp.preset("recommended")

lsp.ensure_installed({
  "html",
  "cssls",
  "tsserver",
  "intelephense",
  "sumneko_lua",
  "rust_analyzer",
})

lsp.on_attach(function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap
  local bind = vim.keymap.set

  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  -- keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", opts) -- go to implementation
  keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts) -- go to implementation
  keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

  -- bind("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", opts)
  -- bind("n", "K", vim.lsp.buf.hover, opts)
  -- bind("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  -- bind("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
  keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
  -- bind("n", "<leader>dh", vim.diagnostic.goto_prev, bufopt)
  -- bind("n", "<leader>dl", vim.diagnostic.goto_next, bufopt)
  -- bind("n", "[d", vim.diagnostic.goto_prev, opts)
  -- bind("n", "]d", vim.diagnostic.goto_next, opts)

  -- Lspsaga Diagnostic
  -- bind('n', '<leader>dl', '<cmd>Lspsaga diagnostic_jump_next<cr>', bufopt)
  -- bind('n', '<leader>dh', '<cmd>Lspsaga diagnostic_jump_prev<cr>', bufopt)
end)
--
-- lsp.configure("tsserver", {
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--   cmd = { "typescript-language-server", "--stdio" },
--   settings = {
--     completions = {
--       completeFunctionCalls = true,
--     },
--   },
-- })

-- local cmp = require("cmp")
-- local luasnip = require("luasnip")
--
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ["<C-Space>"] = cmp.mapping.complete(),
--   ["<Tab>"] = cmp.mapping(function(fallback)
--     if cmp.visible() then
--       cmp.select_next_item()
--     elseif luasnip.expand_or_jumpable() then
--       luasnip.expand_or_jump()
--     else
--       fallback()
--     end
--   end, { "i", "s" }),
--   ["<S-Tab>"] = cmp.mapping(function(fallback)
--     if cmp.visible() then
--       cmp.select_prev_item()
--     elseif luasnip.jumpable(-1) then
--       luasnip.jump(-1)
--     else
--       fallback()
--     end
--   end, { "i", "s" }),
-- })
--
-- lsp.setup_nvim_cmp({
--   sources = {
--     { name = "path" },
--     { name = "nvim_lsp" },
--     { name = "buffer" },
--     { name = "luasnip" },
--     { name = "nvim_lsp_signature_help" },
--   },
--   mapping = cmp_mappings,
--   formatting = {
--     format = require("lspkind").cmp_format({
--       mode = "symbol_text",
--       maxwidth = 50,
--       ellipsis_char = "...",
--     }),
--   },
-- })
--
lsp.set_preferences({
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
  },
})
--
lsp.setup()
--
-- vim.diagnostic.config({
--   virtual_text = true,
--   signs = true,
-- })
