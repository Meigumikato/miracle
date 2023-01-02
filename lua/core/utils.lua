local M = {}

local merge_tb = vim.tbl_deep_extend

function M.load_mapping(section, map_opts)
  local function set_section_map(section_values)

    if section_values.plugin then
      return
    end

    section_values.plugin = nil

    for mode, mode_values in pairs(section_values) do
      -- merge table for options
      local default_opts = merge_tb("force", { mode = mode }, map_opts or {})

      for keybind, mapping_info in pairs(mode_values) do
        local opts = merge_tb('force', default_opts, mapping_info.opts or {})
        mapping_info.opts, opts.mode = nil, nil
        -- for which key
        opts.desc = mapping_info[2]
        vim.keymap.set(mode, keybind, mapping_info[1], opts)
      end
    end
  end

  local mappings = require('core.keymap')
  if type(section) == "string" then
    mappings[section]['plugin'] = nil
    mappings = { mappings[section] }
  end

  -- vim.pretty_print('load_mapping')
  for _, sect in pairs(mappings) do
    set_section_map(sect)
  end
end

return M
