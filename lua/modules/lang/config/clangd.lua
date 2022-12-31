
-- M.disable = true
--
local options = {
  server = {
    cmd = {
      "clangd",
      "--background-index",
      "--pch-storage=memory",
      -- You MUST set this arg ↓ to your c/cpp compiler location (if not included)!
      "--query-driver=/usr/bin/clang++,/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
      "--clang-tidy",
      "--all-scopes-completion",
      "--completion-style=detailed",
      "--header-insertion-decorators",
      "--header-insertion=iwyu",
    },
    on_attach = function(client, bufnr)
      require('navigator.lspclient.mapping').setup({client=client, bufnr=bufnr}) -- setup navigator keymaps here,

      require("navigator.dochighlight").documentHighlight(bufnr)
      require('navigator.codeAction').code_action_prompt(bufnr)
      -- otherwise, you can define your own commands to call navigator functions
    end,
    capabilities = require('modules.completion').common_capabilities(),
    single_file_support = true,
  }
}

require('clangd_extensions').setup(options)
