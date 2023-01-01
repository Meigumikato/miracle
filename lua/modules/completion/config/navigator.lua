local lsp_key_map = {
  { key = "gr", func = require("navigator.reference").async_ref, desc = "async ref" },

  { key = "<c-k>", func = vim.lsp.buf.signature_help, desc = "signature_help" },

  { key = "K", func = vim.lsp.buf.hover, desc = "hover" },
  { key = "gW", func = require("navigator.workspace").workspace_symbol_live, desc = "workspace_symbol_live" },

  { key = "]d", func = vim.diagnostic.goto_next, desc = "next diagnostics" },
  { key = "[d", func = vim.diagnostic.goto_prev, desc = "prev diagnostics" },

  { key = "gd", func = require("navigator.definition").definition, desc = "definition" },
  { key = "gD", func = vim.lsp.buf.declaration, desc = "declaration" },
  { key = "gp", func = require("navigator.definition").definition_preview, desc = "definition_preview" },
  { key = "gi", func = vim.lsp.buf.implementation, desc = "implementation" },
  { key = "gl", func = require("navigator.diagnostics").show_diagnostics, desc = "show_diagnostics" },
  { key = "gL", func = require("navigator.diagnostics").show_buf_diagnostics, desc = "show_buf_diagnostics" },

  { key = "<leader>ct", func = require("navigator.treesitter").buf_ts, desc = "buf_ts" },
  { key = "<leader>cT", func = require("navigator.treesitter").bufs_ts, desc = "bufs_ts" },

  {
    mode = "v",
    key = "<leader>ca",
    func = require("navigator.codeAction").range_code_action,
    desc = "range_code_action",
  },
  { key = "<leader>ca", mode = "n", func = require("navigator.codeAction").code_action, desc = "code_action" },

  { key = "<leader>ci", func = vim.lsp.buf.incoming_calls, desc = "incoming_calls" },
  { key = "<leader>co", func = vim.lsp.buf.outgoing_calls, desc = "outgoing_calls" },

  { mode = "n", key = "<leader>cf", func = vim.lsp.buf.format, desc = "format" },
  { mode = "v", key = "<leader>cf", func = vim.lsp.buf.format, desc = "format" },
}

-- set lsp diagnostic icons
local icons = require('core.icons')

local diagnostics_signs = {
  Error = icons.diagnostics.BoldError,
  Warn = icons.diagnostics.BoldWarning,
  Hint = icons.diagnostics.BoldHint,
  Info = icons.diagnostics.BoldInformation,
}

for type, icon in pairs(diagnostics_signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

require("navigator").setup({
  debug = true, -- log output, set to true and log path: ~/.cache/nvim/gh.log
  width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
  height = 0.3, -- max list window height, 0.3 by default
  preview_height = 0.4, -- max height of preview windows
  border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- border style, can be one of 'none', 'single', 'double',
  -- 'shadow', or a list of chars which defines the border
  on_attach = nil,

  ts_fold = false, -- modified version of treesitter folding
  default_mapping = false, -- set to false if you will remap every key or if you using old version of nvim-
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
    debug = false,
    fix_pos = false,
    handler_opts = {
      border = "rounded"
    },
  },
  icons = {
    icons = false,
  },
  lsp_installer = false,
  mason = false,
  lsp = {
    enable = true,

    code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
    code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
    document_highlight = true, -- LSP reference highlight,

    format_on_save = {
      enable = {
        'lua',
        'go'
      },
      disable = {
        'cpp',
        'c',
      },
    },
    format_options = { async = true },
    -- disable for use null ls
    disable_format_cap = 'all',
    -- a list of lsp disable format capacity (e.g. if you using efm or vim-codeformat etc), empty {} by default
    -- If you using null-ls and want null-ls format your code
    -- you should disable all other lsp and allow only null-ls.

    -- ["neodev"] = { runtime_path = true },
    disable_lsp = { "angularls", "gopls", "tsserver", "flow", "bashls", "dockerls", "julials", "pylsp", "pyright",
      "jedi_language_server", "jdtls", "vimls", "html", "jsonls", "solargraph", "cssls",
      "yamlls", "clangd", "ccls", "sqls", "denols", "graphql", "dartls", "dotls",
      "kotlin_language_server", "nimls", "intelephense", "vuels", "phpactor", "omnisharp",
      "r_language_server", "rust_analyzer", "terraformls", "svelte", "texlab", "clojure_lsp", "elixirls",
      "sourcekit", "fsautocomplete", "vls", "hls" },

    diagnostic = {
      underline = true,
      virtual_text = true, -- show virtual for diagnostic message
      update_in_insert = false, -- update diagnostic message in insert mode
    },

    diagnostic_scrollbar_sign = false, -- experimental:  diagnostic status in scroll bar area; set to false to disable the diagnostic sign,

    diagnostic_virtual_text = true,
    diagnostic_update_in_insert = false,
    disply_diagnostic_qf = true,

    servers = nil, -- by default empty, and it should load all LSP clients avalible based on filetype
    -- but if you whant navigator load  e.g. `cmake` and `ltex` for you , you
    -- can put them in the `servers` list and navigator will auto load them.
    -- you could still specify the custom config  like this
    -- cmake = {filetypes = {'cmake', 'makefile'}, single_file_support = false},
  },
})
