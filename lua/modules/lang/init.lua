local M = {}

M.on_attach = nil
M.capabilities = nil

M.plugins = require('modules.lang.plugins')

function M.setup()
  require('modules.lang.config').setup()
end


return M
