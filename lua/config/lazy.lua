local M = {}

local function load_lazy()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.runtimepath:prepend(lazypath)
end

local lazy_options = {
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- custom
    -- { import = "lazyvim.plugins.extras.editor.navic" },
    { import = "ui" },
    { import = "langs.bash" },
    { import = "langs.cmake" },
    { import = "langs.clangd" },
    { import = "langs.go" },
    { import = "langs.python" },
    -- { import = "langs.helm" },
    { import = "langs.luals" },
    -- { import = "plugins.lualine" },

    { import = "plugins" },
  },
  defaults = { lazy = false, version = false },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

function M.load_config()
  load_lazy()

  require("lazy").setup(lazy_options)
end

return M
