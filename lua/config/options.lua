vim.opt.updatetime = 200
vim.opt.smoothscroll = true
vim.opt.splitkeep = "screen"

vim.opt.undofile = true
vim.opt.undolevels = 10000

vim.opt.showbreak = "↪ "
vim.opt.linebreak = true

if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font:h13"
  vim.g.neovide_cursor_vfx_mode = "ripple"
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_hide_mouse_when_typing = true
end

require("config.vscode")
