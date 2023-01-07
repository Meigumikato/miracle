-- M.disable = true
--
local options = {
  server = {
    cmd = {
      "clangd",
      "--background-index",
      "--pch-storage=memory",
      -- You MUST set this arg ↓ to your c/cpp compiler location (if not included)!
      -- "--query-driver=/usr/bin/clang++,/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
      "--clang-tidy",
      -- "--all-scopes-completion",
      "--completion-style=detailed",
      -- "--header-insertion-decorators",
      "--header-insertion=iwyu",
      "--offset-encoding=utf-16"
    },
    on_attach = require('modules.lang').on_attach,
    capabilities = require('modules.lang').capabilities,
    single_file_support = true,
  }
}

require('clangd_extensions').setup(options)
