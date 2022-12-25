local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  return
end

local mason_lsp_status_ok, mason_lsp = pcall(require, 'mason-lspconfig')
if not mason_lsp_status_ok then
  return
end

local status_ok_lsp_config, lspconfig = pcall(require, 'lspconfig')
if not status_ok_lsp_config then
  return
end

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status_ok then
  return
end

mason.setup()
mason_lsp.setup {
  ensure_installed = { 'sumneko_lua', 'tsserver' }
}

local capabilities = cmp_nvim_lsp.default_capabilities()

mason_lsp.setup_handlers {
  function(server_name) -- default handler
    lspconfig[server_name].setup {
      capabilities = capabilities
    }
  end,
  ['rust_analyzer'] = function()
    local status_ok_rust_tools, rust_tools = pcall(require, 'rust-tools')
    if not status_ok_rust_tools then
      return
    end

    rust_tools.setup {}
  end,
  ['sumneko_lua'] = function()
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
  end,
}
