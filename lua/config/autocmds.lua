vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "c",
    "cpp",
    "cxx",
  },
  callback = function()
    vim.opt.commentstring = "// %s"
  end,
})
