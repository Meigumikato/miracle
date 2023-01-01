local M = {}

local function load_lazy()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      "https://github.com/folke/lazy.nvim.git",
      lazypath,
    })
  end
  vim.opt.runtimepath:prepend(lazypath)
end

local function convert_plugin_list(plugins)
  local res = {}
  for key, config in pairs(plugins) do
    config[1] = key
    res[#res + 1] = config
  end


  return res
end

local lazy_options = {
  performance = {
    defaults = { lazy = true, version = "*" },
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = { enabled = true },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

function M:load_config()
  load_lazy()

  local modules_plugins = require('modules').plugins

  -- vim.pretty_print(modules_plugins)

  local startup_plugin_list = convert_plugin_list(modules_plugins)

  -- vim.pretty_print(startup_plugin_list)

  require('lazy').setup(startup_plugin_list, lazy_options)


end

return M
