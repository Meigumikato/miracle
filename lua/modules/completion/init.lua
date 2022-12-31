local M = {}

M.plugins = require('modules.completion.plugins')

function M.common_on_attach(client, bufnr)

  -- if client.server_capabilities["documentSymbolProvider"] then
  --   require("nvim-navic").attach(client, bufnr)
  -- end
end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  return require('cmp_nvim_lsp').default_capabilities(capabilities)
end

return M
