local options = {
  -- rust-tools options
  tools = {
    -- how to execute terminal commands
    -- options right now: termopen / quickfix
    -- executor = require("rust-tools/executors").termopen,

    -- callback to execute once rust-analyzer is done initializing the workspace
    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
    on_initialized = nil,
      -- vim.pretty_print("rust_analyzer")
      -- require("lsp_signature").on_attach({
      --   bind = true,
      --   use_lspsaga = false,
      --   floating_window = true,
      --   fix_pos = true,
      --   hint_enable = true,
      --   handler_opts = {
      --     border = 'rounded',
      --   },
      -- })
    -- end,

  },
  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
  server = {
    -- standalone file support
    -- setting it to false may improve startup time
    on_attach = function(client, bufnr)
      require('navigator.lspclient.mapping').setup({client=client, bufnr=bufnr}) -- setup navigator keymaps here,
      require("navigator.dochighlight").documentHighlight(bufnr)
      require('navigator.codeAction').code_action_prompt(bufnr)
      -- otherwise, you can define your own commands to call navigator functions
    end,
    capabilities = require('modules.completion').common_capabilities(),
  },

  -- debugging stuff
  dap = {
    adapter = {
      type = "executable",
      command = "lldb-vscode",
      name = "rt_lldb",
    },
  },
}

require('rust-tools').setup()
--
-- local M = {}
-- function M.setup(on_attach, capabilities)
--
--   local lspconfig = require('lspconfig')
--
--   lspconfig.rust_analyzer.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end
--
-- return M
--

