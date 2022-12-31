local M = {}


local lsplist = {
  'sumneko_lua',
  -- 'clangd',
  -- 'rust_analyzer'
}

local function helper(lspname)
  local prefix = 'modules.lang.config.'
  return prefix .. lspname
end

function M.setup(on_attach, capabilities)
  for _, value in pairs(lsplist) do
    local lsp_config = require(helper(value))
    -- vim.pretty_print(lsp_config)

    if not lsp_config.diable or lsp_config.diable == false then
      lsp_config.setup(on_attach, capabilities)
    end
  end
end

return M
