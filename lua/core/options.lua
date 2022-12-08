vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"

vim.o.background = 'dark'
vim.o.completeopt = 'menu,menuone,preview,noselect'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.o.completeopt = { 'menu', 'menuone', 'preview', 'noselect' }
vim.opt.mouse = ''

vim.cmd([[colorscheme tokyonight-night]])
-- vim.o.winbar = " %{%v:lua.require'nvim-navic'.get_location()%} "
