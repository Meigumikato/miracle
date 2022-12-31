

local lsp_key_map = {
  { key = 'gr', func = require('navigator.reference').async_ref, desc = 'async ref' },

  { key = '<c-k>', func = vim.lsp.buf.signature_help, desc = 'signature_help' },

  { key = 'K', func = vim.lsp.buf.hover, desc = 'hover'},
  { key = 'gW', func = require('navigator.workspace').workspace_symbol_live, desc = 'workspace_symbol_live' },

  { key = ']d', func = vim.diagnostic.goto_next, desc = 'next diagnostics' },
  { key = '[d', func = vim.diagnostic.goto_prev, desc = 'prev diagnostics' },

  { key = 'gd', func = require('navigator.definition').definition, desc = 'definition' },
  { key = 'gD', func = vim.lsp.buf.declaration, desc = 'declaration' },
  { key = 'gp', func = require('navigator.definition').definition_preview, desc = 'definition_preview' },
  { key = 'gi', func = vim.lsp.buf.implementation, desc = 'implementation' },
  { key = 'gl', func = require('navigator.diagnostics').show_diagnostics, desc = 'show_diagnostics' },
  { key = 'gL', func = require('navigator.diagnostics').show_buf_diagnostics, desc = 'show_buf_diagnostics' },

  { key = '<leader>ct', func = require('navigator.treesitter').buf_ts, desc = 'buf_ts' },
  { key = '<leader>cT', func = require('navigator.treesitter').bufs_ts, desc = 'bufs_ts' },

  { mode = 'v', key = '<leader>ca', func = require('navigator.codeAction').range_code_action, desc = 'range_code_action', },
  { key = '<leader>ca', mode = 'n', func = require('navigator.codeAction').code_action, desc = 'code_action' },

  { key = '<leader>ci', func = vim.lsp.buf.incoming_calls, desc = 'incoming_calls' },
  { key = '<leader>co', func = vim.lsp.buf.outgoing_calls, desc = 'outgoing_calls' },

  { mode = 'n', key = '<leader>cf', func = vim.lsp.buf.format,  desc = 'format' },
  { mode = 'v', key = '<leader>cf', func = vim.lsp.buf.range_formatting,  desc = 'range format' },
}

require'navigator'.setup({
  debug = false, -- log output, set to true and log path: ~/.cache/nvim/gh.log
  width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
  height = 0.3, -- max list window height, 0.3 by default
  preview_height = 0.35, -- max height of preview windows
  border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}, -- border style, can be one of 'none', 'single', 'double',
                                                     -- 'shadow', or a list of chars which defines the border
  on_attach = function(client, bufnr)
    -- your hook
  end,

  ts_fold = false,  -- modified version of treesitter folding
  default_mapping = false,  -- set to false if you will remap every key or if you using old version of nvim-
  keymaps = lsp_key_map,

  -- this kepmap gK will override "gD" mapping function declaration()  in default kepmap
  -- please check mapping.lua for all keymaps
  treesitter_analysis = true, -- treesitter variable context
  treesitter_analysis_max_num = 100, -- how many items to run treesitter analysis
  treesitter_analysis_condense = true, -- condense form for treesitter analysis
  -- this value prevent slow in large projects, e.g. found 100000 reference in a project
  transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it

  lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
  -- setup here. if it is nil, navigator will not init signature help
  signature_help_cfg = {
    fix_pos = true,
  }, -- if you would like to init ray-x/lsp_signature plugin in navigator, and pass in your own config to signature help
  icons = {
    -- Code action
    code_action_icon = "🏏", -- note: need terminal support, for those not support unicode, might crash
    -- Diagnostics
    diagnostic_head = '🐛',
    diagnostic_head_severity_1 = "🈲",
    -- refer to lua/navigator.lua for more icons setups
  },
  lsp = {
    enable = true,  -- skip lsp setup, and only use treesitter in navigator. 
                    -- Use this if you are not using LSP servers, and only want to enable treesitter support. 
                    -- If you only want to prevent navigator from touching your LSP server configs, 
                    -- use `disable_lsp = "all"` instead. 
                    -- If disabled, make sure add require('navigator.lspclient.mapping').setup({bufnr=bufnr, client=client}) in your
                    -- own on_attach
    code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
    code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
    document_highlight = true, -- LSP reference highlight, 
                               -- it might already supported by you setup, e.g. LunarVim
    format_on_save =  {
      enable = {
        'lua',
        'go',
      },
      disable = {
        'cpp',
        'c'
      }
    }, -- {true|false} set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
                           -- table: {enable = {'lua', 'go'}, disable = {'javascript', 'typescript'}} to enable/disable specific language
                              -- enable: a whitelist of language that will be formatted on save
                              -- disable: a blacklist of language that will not be formatted on save
                           -- function: function(bufnr) return true end to enable/disable lsp format on save
    format_options = { async = true }, -- async: disable by default, the option used in vim.lsp.buf.format({async={true|false}, name = 'xxx'})
    disable_format_cap = { "sqls", "sumneko_lua", "gopls" },  -- a list of lsp disable format capacity (e.g. if you using efm or vim-codeformat etc), empty {} by default
                                                            -- If you using null-ls and want null-ls format your code
                                                            -- you should disable all other lsp and allow only null-ls.
    disable_lsp = {
      "angularls",  "tsserver", "flow",  "dockerls", "julials", "pylsp", "jedi_language_server",
      "jdtls",  "vimls", "html",  "solargraph", "cssls", "ccls", "sqls", "denols", "graphql",
      "dartls", "dotls", "kotlin_language_server", "nimls", "intelephense", "vuels", "phpactor",
      "omnisharp", "r_language_server", "terraformls", "clangd", "rust_analyzer",
    },
    -- disable_lsp = {'pylsd', 'sqlls'},  -- prevents navigator from setting up this list of servers. 
                                          -- if you use your own LSP setup, and don't want navigator to setup 
                                          -- any LSP server for you, use `disable_lsp = "all"`.
                                          -- you may need to add this to your own on_attach hook: 
                                          -- require('navigator.lspclient.mapping').setup({bufnr=bufnr, client=client})
                                          -- for e.g. denols and tsserver you may want to enable one lsp server at a time.
                                          -- default value: {}
    diagnostic = {
      underline = true,
      virtual_text = true, -- show virtual for diagnostic message
      update_in_insert = false, -- update diagnostic message in insert mode
    },

    diagnostic_scrollbar_sign = false, -- experimental:  diagnostic status in scroll bar area; set to false to disable the diagnostic sign,

    diagnostic_virtual_text = true,  -- show virtual for diagnostic message
    diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
    disply_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors, set to false if you want to ignore it
    ['neodev'] = { runtime_path = true },

    servers = {'cmake'}, -- by default empty, and it should load all LSP clients avalible based on filetype
    -- but if you whant navigator load  e.g. `cmake` and `ltex` for you , you
    -- can put them in the `servers` list and navigator will auto load them.
    -- you could still specify the custom config  like this
    -- cmake = {filetypes = {'cmake', 'makefile'}, single_file_support = false},
  }
})
