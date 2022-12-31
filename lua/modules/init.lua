local M = {}


M.ui = require('modules.ui')
M.editor = require('modules.editor')
M.lang = require('modules.lang')
M.tools = require('modules.tools')
M.completion = require('modules.completion')


-- local final = vim.tbl_deep_extend("force", M.ui, M.lang, M.tools, M.completion)

M.plugins = vim.tbl_deep_extend("force", M.ui, M.lang, M.tools, M.completion, M.editor).plugins

-- vim.pretty_print(final)


return M
