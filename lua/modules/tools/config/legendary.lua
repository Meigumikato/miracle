local function config ()
  require('legendary').setup {
    which_key = { auto_register = true },
    -- autocmds = require('core.autocmds'),
  }
end

return config
