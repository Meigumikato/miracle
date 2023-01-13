local options = {
	server = {
		-- standalone file support
		-- setting it to false may improve startup time
		standalone = false,
		on_attach = require("modules.lang").on_attach,
		capabilities = require("modules.lang").capabilities,
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
					loadOutDirsFromCheck = true,
					runBuildScripts = true,
				},
				-- Add clippy lints for Rust.
				checkOnSave = {
					command = "clippy",
				},
				procMacro = {
					enable = true,
				},
			},
		},
	},
}

require("rust-tools").setup(options)
