local M = {}

local icons = require('core.icons')
local utils = require('core.utils')
local lspconfig = require('lspconfig')

function M.common_on_attach(client, bufnr)
  -- load lsp key map
  utils.load_mapping('lspconfig', { buffer = bufnr })
  -- winbar config
  -- if client.server_capabilities.documentSymbolProvider then
  --     require('nvim-navic').attach(client, bufnr)
  -- end
end

function M.common_capabilities()

  local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end

  -- vim.api.nvim_echo({
  --   {'WARNING: common_capabilities'},
  --   {'cmp_nvim_lsp get failed'} }, false, {})

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    },
  }
  return capabilities
end


local diagnostics_signs = {
  Error = icons.diagnostics.BoldError,
  Warn = icons.diagnostics.BoldWarning,
  Hint = icons.diagnostics.BoldHint,
  Info = icons.diagnostics.BoldInformation,
}

for type, icon in pairs(diagnostics_signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})


lspconfig.sumneko_lua.setup {
  on_attach = M.common_on_attach,
  capabilities = M.common_capabilities(),
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          -- vim.api.nvim_get_runtime_file("", true),
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          -- require('neodev.config').types(),
          '${3rd}/busted/library',
          '${3rd}/luassert/library',
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.clangd.setup {
  on_attach = M.common_on_attach,
  capabilities = M.common_capabilities(),
}

return M
