return {
  {
    "nvim-neotest/neotest",
    dependencies = { "fredrikaverpil/neotest-golang" },
    opts = {
      adapters = {
        ["neotest-golang"] = { args = { "-count=1", "-race" } },
      },
    },
  },
}
