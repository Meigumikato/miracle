local M = {}

-- lazygit
vim.keymap.set("n", "<leader>gz", function()
  require("lazy.util").open_cmd({ "lazygit" }, {
    terminal = true,
    close_on_exit = true,
    enter = true,
    float = {
      size = { width = 0.9, height = 0.9 },
      margin = { top = 0, right = 0, bottom = 0, left = 0 },
    },
  })
end, { desc = "Lazygit" })

return M
