vim.defer_fn(
function()
  pcall(require, 'impatient')
end, 0)

require('core')

EnsurePacker = function()
  local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
    print "Cloning packer .."
    vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

require('plugins').setup(EnsurePacker())
