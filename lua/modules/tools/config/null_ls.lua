local null_ls = require("null-ls")
null_ls.setup({
	debug = false,
	sources = {
		-- format
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.shfmt,

		-- lint
		null_ls.builtins.diagnostics.golangci_lint,
		null_ls.builtins.code_actions.shellcheck,
		-- null_ls.builtins.diagnostics.cpplint,
		null_ls.builtins.diagnostics.jsonlint,
		-- null_ls.builtins.diagnostics.cppcheck
	},
})
