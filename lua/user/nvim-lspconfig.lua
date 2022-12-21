local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status_ok then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- TODO: somehow merge these with `mason` config

lspconfig.rust_analyzer.setup {
  capabilities = capabilities
}

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

lspconfig.tsserver.setup {
  capabilities = capabilities
}
