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
    { import = "lazyvim.plugins.extras.ui.dashboard" },

    -- { import = "lazyvim.plugins.extras.coding.copilot" },

    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.dap.nlua" },

    { import = "lazyvim.plugins.extras.util.project" },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },

    { import = "lazyvim.plugins.extras.test.core" },

    { import = "lazyvim.plugins.extras.linting.eslint" },

    { import = "lazyvim.plugins.extras.formatting.prettier" },

    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.clangd" },
    { import = "lazyvim.plugins.extras.lang.cmake" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.yaml" },

    -- { import = "lazyvim.plugins.extras.ui.edgy" },

    { import = "lazyvim.plugins.extras.editor.mini-files" },

    { import = "lazyvim.plugins.extras.coding.yanky" },

    -- custom
    { import = "ui" },
    { import = "langs.bash" },
    { import = "langs.cmake" },
    { import = "langs.clangd" },
    { import = "langs.go" },
    { import = "langs.python" },

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
