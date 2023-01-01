local icons = require('core.icons')



local diagnostics_signs = {
  Error = icons.diagnostics.BoldError,
  Warn = icons.diagnostics.BoldWarning,
  Hint = icons.diagnostics.BoldHint,
  Info = icons.diagnostics.BoldInformation,
}

local function common_on_attach(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "<leader>hs", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, bufopts)

  require "lsp_signature".on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded"
      }
  }, bufnr)
  -- if client.server_capabilities["documentSymbolProvider"] then
  --   require("nvim-navic").attach(client, bufnr)
  -- end
end

local function common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

local function config()
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

  local lang = require('modules.lang')
  lang.on_attach = common_on_attach
  lang.capabilities = common_capabilities()

  require('modules.lang').setup()
end



return config
