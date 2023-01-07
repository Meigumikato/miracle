local M = {}


local lsplist = {
  'sumneko_lua',
  -- 'clangd',
  -- 'rust_analyzer'
}

local autolist = {
  'jsonls',
  'bashls',
}

local function helper(lspname)
  local prefix = 'modules.lang.config.'
  return prefix .. lspname
end

function M.setup()
  local on_attach = require('modules.lang').on_attach
  local capabilities = require("modules.lang").capabilities
  -- capabilities.offsetEncoding = { "utf-16" }
  local bufnr = vim.api.nvim_get_current_buf()

  for _, value in pairs({'go', 'cpp', 'c', 'rust'}) do
    if value == vim.bo[bufnr].filetype then
      -- vim.notify('single config lsp', vim.log.levels.INFO)
      return
    end
  end

  -- if vim.bo[bufnr].filetype == 'lua' then
  --   require('neodev').setup()
  -- end

  for _, value in pairs(lsplist) do
    local lsp_config = require(helper(value))

    if not lsp_config.diable or lsp_config.diable == false then
      lsp_config.setup(on_attach, capabilities)
    end
  end

  for _, value in pairs(autolist) do
    require('lspconfig')[value].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

end

return M
