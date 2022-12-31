local M = {}
M. default_opt = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

--- @register key to whichkey
--- @param keys string(required)
--- @param rhs string or function (required)
--- @param desc string (optional)
--- @param opts table (optional)
function M.whichkey_register(keys, rhs, desc, opts)
  if keys == "" or rhs == "" or opts ~= nil and type(opts) ~= "table" then
    return
  end

  local wk = require('whichkey')
  local lhs = "<leader>" .. keys

  local temp_map = {
    [lhs] = {
      rhs,
      desc,
    }
  }

  for key, val in pairs(opts) do
    temp_map[lhs][key] = val
  end

  wk.register(temp_map)
end


return M
