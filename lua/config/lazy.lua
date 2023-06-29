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
    -- import LazyVim plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.dap.nlua" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.util.project" },
    { import = "lazyvim.plugins.extras.ui.edgy" },

    { import = "lazyvim.plugins.extras.test.core" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.editor.mini-files" },
    { import = "lazyvim.plugins.extras.editor.flash" },
    { import = "lazyvim.plugins.extras.coding.yanky" },

    -- import/override with your plugins
    { import = "ui" },
    { import = "langs.gopls" },
    { import = "langs.bash" },
    { import = "langs.cmake" },
    { import = "langs.rust_analyzer" },
    { import = "langs.clangd" },
    { import = "tools.lspsaga" },
    { import = "langs.python" },
    { import = "tools.neorg" },
    { import = "tools.context" },
    { import = "tools.diffview" },
    { import = "tools.navi" },
    { import = "tools.refactoring" },

    { import = "plugins" },
  },
  defaults = { lazy = false, version = false },
  install = { colorscheme = { "tokyonight", "habamax", "moonbow" } },
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
