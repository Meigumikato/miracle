local M = {}

local icons = require('core.icons')

M.options = {
  active = true,
  on_config_done = nil,
  options = {
    enabled = true,
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "text",
    },
    char = icons.ui.LineLeft,
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = true,
    show_current_context = true,
  },
}

M.setup = function()
  local status_ok, indent_blankline = pcall(require, "indent_blankline")
  if not status_ok then
    vim.api.nvim_echo({{"WARNING indent_blankline loadfailed"}}, false, {})
    return
  end

  indent_blankline.setup(M.options)
end

return M

