return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
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
