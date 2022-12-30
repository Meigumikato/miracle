-- local nmap_opts = {}

local function config()
  local nmap = require('keymap').nmap
  local wk = require('which-key')

  wk.register(nmap)
end

return config
