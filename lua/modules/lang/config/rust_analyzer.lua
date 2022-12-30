local M = {}
function M.setup(on_attach, capabilities)

  -- local lspconfig = require('lspconfig')

  -- lspconfig.rust_analyzer.setup {
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  -- }
  local rt = require('rust-tools')

  rt.setup({
    server = {
      on_attach = on_attach,
      capabilities = capabilities,
      standalone = true,
    }
  })
end

return M
