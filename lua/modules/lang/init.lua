local M = {}

M.plugins = require('modules.lang.plugins')

function M.setup(on_attach, capabilities)
  require('modules.lang.config').setup(on_attach, capabilities)
end

return M
