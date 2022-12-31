local icons = require('core.icons')


local diagnostics_signs = {
  Error = icons.diagnostics.BoldError,
  Warn = icons.diagnostics.BoldWarning,
  Hint = icons.diagnostics.BoldHint,
  Info = icons.diagnostics.BoldInformation,
}

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


  local completion = require('modules.completion')
  require('modules.lang').setup(completion.common_on_attach, completion.common_capabilities())
end



return config
