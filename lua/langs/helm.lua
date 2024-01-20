return {

  {
    "towolf/vim-helm",
    ft = { "helm" },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        helm_ls = {
          cmds = { "helm_ls", "serve" },
          filetypes = { "helm" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("Chart.yaml")(fname)
          end,
        },
      },
    },
  },
}
