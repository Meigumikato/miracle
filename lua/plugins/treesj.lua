return {
  {
    "Wansmer/treesj",
    keys = {
      { "gS", function() require("treesj").toggle() end, desc = "Toggle split/join" },
      { "gJ", function() require("treesj").join() end, desc = "Join lines" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
}
