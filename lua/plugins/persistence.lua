local M = {}

local utils = require('core.utils')

M.options = {
  dir = vim.fn.expand(vim.fn.stdpath("config") .. "/sessions/"), -- directory where session files are saved
  options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
}


function M.setup()
  require('persistence').setup(M.options)
  utils.load_mapping('persistence')
end



return M
