return {
  {
    "mbbill/undotree",
    keys = { { "<leader>cu", "<cmd>UndotreeToggle<cr>", desc = "Undo tree" } },
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_WindowLayout = 2
    end,
  },
}
