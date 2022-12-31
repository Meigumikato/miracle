vim.g.mapleader = " "
vim.g.localleader = " "
vim.g.theme_switcher_loader = true

vim.o.background = 'dark'
vim.o.completeopt = 'menu,menuone,preview,noselect'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.opt.shiftwidth = 2
vim.opt.shiftround = true -- Round indent
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
-- vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically

-- vim.opt.timeout = true
vim.opt.timeoutlen = 300

vim.opt.confirm = true -- confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line

vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
vim.opt.cmdheight = 1
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.guifont = "FiraCode Nerd Font:h11"
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup

vim.opt.mouse = ''

-- vim.opt.listchars:append "eol:↴"
--
vim.opt.splitbelow = true -- Put new windows below current
-- vim.opt.splitkeep = "screen"
vim.opt.splitright = true -- Put new windows right of current


vim.opt.undofile = true
vim.opt.undolevels = 10000


-- vim.cmd([[colorscheme tokyonight-night]])
-- vim.o.winbar = " %{%v:lua.require'nvim-navic'.get_location()%} "
