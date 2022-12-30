local M = {}

-- M.disable = true

function M.setup(on_attach, capabilities)

  -- local lspconfig = require('lspconfig')

  local clangd_ext = require('clangd_extensions')

  -- debug
  clangd_ext.prepare(
    {
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
        single_file_support = true,
      }
    }
  )

  -- lspconfig.clangd.setup {
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  -- }
  clangd_ext.setup()

end

return M
