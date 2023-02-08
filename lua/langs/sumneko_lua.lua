return {
    -- add json to treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          ---@diagnostic disable-next-line: missing-parameter
          vim.list_extend(opts.ensure_installed, { "lua" })
        end,
    },

    -- correctly setup lspconfig
    {
        "neovim/nvim-lspconfig",
        ft = { "lua" },
        opts = {
            -- make sure mason installs the server
            servers = {
                sumneko_lua = {
                    settings = {
                        Lua = {
                            runtime = {
                                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                version = "LuaJIT",
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                            diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = { "vim" },
                            },
                            workspace = {
                                -- Make the server aware of Neovim runtime files
                                library = {
                                    vim.api.nvim_get_runtime_file("", true),
                                    vim.fn.expand("$VIMRUNTIME/lua"),
                                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                                    -- require('neodev.config').types(),
                                },
                                maxPreload = 100000,
                                preloadFileSize = 10000,
                            },
                            -- Do not send telemetry data containing a randomized but unique identifier
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                },
            },
        },
    },
}
