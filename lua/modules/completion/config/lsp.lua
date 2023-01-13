local icons = require("core.icons")
local utils = require("utils")

local diagnostics_signs = {
	Error = icons.diagnostics.BoldError,
	Warn = icons.diagnostics.BoldWarning,
	Hint = icons.diagnostics.BoldHint,
	Info = icons.diagnostics.BoldInformation,
}

local function common_on_attach(client, bufnr)
	require("modules.completion.config.keymaps").on_attach(client, bufnr)
	require("modules.completion.config.format").on_attach(client, bufnr)
end

local function common_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

local function diagnostic()
	for type, icon in pairs(diagnostics_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	vim.diagnostic.config({
		underline = true,
		update_in_insert = false,
		virtual_text = { spacing = 4, prefix = "●" },
		severity_sort = true,
	})
end

local servers = { jsonls = {}, sumneko_lua = {} }

local function config()
	diagnostic()

	local lang = require("modules.lang")

	local capabilities = common_capabilities()
	-- local on_attach = common_on_attach
	utils.on_attach(function(client, bufnr)
		common_on_attach(client, bufnr)
	end)

	-- lang.on_attach = on_attach
	lang.capabilities = capabilities

	-- require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
	--
	-- require("mason-lspconfig").setup_handlers({
	-- 	function(server)
	-- 		-- vim.pretty_print(server)
	-- 		local server_opts = servers[server] or {}
	--
	-- 		if server == "sumneko_lua" then
	-- 			vim.pretty_print(server_opts)
	-- 			local exist, custom_opts = pcall(require, "modules.lang.config." .. server)
	-- 			if exist then
	-- 				vim.pretty_print(server)
	-- 				server_opts = custom_opts
	-- 				vim.pretty_print(server_opts)
	-- 			end
	-- 		end
	--
	-- 		server_opts.capabilities = capabilities
	-- 		require("lspconfig")[server].setup(server_opts)
	-- 	end,
	-- })
	-- require("modules.lang").setup()
end

return config
