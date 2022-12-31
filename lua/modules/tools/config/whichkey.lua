-- local nmap_opts = {}
--
-- local icons = require('core.icons')

local options = {
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  operators = { gc = "Comments" },
  -- icons = {
  --   breadcrumb = icons.ui.Separator,
  --   separator = icons.misc.Vbar,
  --   group = icons.misc.Add,
  -- },

  window = {
    border = "single",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 1, 1, 1, 1 },
    winblend = 0,
  },

  disable = {

  }
}

local function config()
  local nmap = require('keymap').nmap
  local tmap = require('keymap').tmap
  local wk = require('which-key')
  wk.setup(options)
  wk.register(nmap)
  wk.register(tmap)

end

return config
