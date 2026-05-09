return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                library = {
                  "/Users/bytedance/Code/freeswitch_lua/completion/",
                },
              },
            },
          },
        },
      },
    },
  },
}
