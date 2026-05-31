return {
  {
    "folke/which-key.nvim",
    opts = { spec = { { "<leader>z", group = "LeetCode" } } },
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    cmd = "Leet",
    keys = {
      { "<leader>zt", "<cmd>Leet test<cr>", desc = "LeetCode Test" },
      { "<leader>zl", "<cmd>Leet list<cr>", desc = "LeetCode List" },
      { "<leader>zd", "<cmd>Leet desc<cr>", desc = "LeetCode Description" },
      { "<leader>zs", "<cmd>Leet submit<cr>", desc = "LeetCode Submit" },
      { "<leader>zm", "<cmd>Leet menu<cr>", desc = "LeetCode Menu" },
      { "<leader>zi", "<cmd>Leet info<cr>", desc = "LeetCode Info" },
      { "<leader>zb", "<cmd>Leet tabs<cr>", desc = "LeetCode Tabs" },
      { "<leader>zo", "<cmd>Leet<cr>", desc = "LeetCode Open" },
      { "<leader>zc", "<cmd>Leet console<cr>", desc = "LeetCode Console" },
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      storage = { home = "~/Projects/algorithm/problems" },
      cn = { -- leetcode.cn
        enabled = true, ---@type boolean
        translator = false, ---@type boolean
        translate_problems = false, ---@type boolean
      },
      injector = {
        ["cpp"] = {
          -- before = { [[#include <bits/stdc++.h>]], [[using namespace std;]] },
          after = "int main(int argc, char** argv) {\n return 0;\n }",
        },
      },
      description = { position = "left", width = "40%", show_stats = false },
      plugins = { non_standalone = true },
    },
  },
}
