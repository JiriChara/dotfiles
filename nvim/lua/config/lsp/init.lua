-- Informative diagnostic presenttion without being noisy
vim.diagnostic.config({
  underline = true,
  virtual_text = {
    spacing = 2,
    prefix = "●",
    severity = { min = vim.diagnostic.severity.WARN },
  },
  signs = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Standard on_attach sets buffer local keymaps and options
local function on_attach(client, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  -- LSP keymaps
  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "gr", vim.lsp.buf.references, "List references")
  map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  map("n", "gt", vim.lsp.buf.type_definition, "Type definition")
  map("n", "K", vim.lsp.buf.hover, "Hover")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")

  -- Format command that prefers server formatting when available
  vim.api.nvim_buf_create_user_command(bufnr, "LspFormat", function()
    vim.lsp.buf.format({ async = true })
  end, { desc = "Format current buffer with LSP or formatter" })

  -- Optional: tweak semantic tokens if your theme supports them
  if client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens then
    vim.lsp.semantic_tokens.start(bufnr, client.id)
  end
end

-- Completion capabilities negotiated with nvim-cmp if present
local capabilities = vim.lsp.protocol.make_client_capabilities()
do
  local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
  if ok then
    capabilities = cmp_lsp.default_capabilities(capabilities)
  end
end

vim.lsp.config("lua_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
  -- TODO: remove this currently Mason version of lua-lsp is not working well on arch
  cmd = { "/usr/bin/lua-language-server" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

-- TS/Vue.js LSP configuration
local vue_language_server_path =
  vim.fn.expand("$MASON/packages" .. "/vue-language-server" .. "/node_modules/@vue/language-server")
local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}
local ts_ls_config = {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    plugins = {
      vue_plugin,
    },
  },
  filetypes = tsserver_filetypes,
}
local vue_ls_config = {
  on_attach = on_attach,
  capabilities = capabilities,
}
vim.lsp.config("vue_ls", vue_ls_config)
vim.lsp.config("ts_ls", ts_ls_config)

-- Eslint
vim.lsp.config("eslint", {})
