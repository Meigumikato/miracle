local function config()
	require("dressing").setup({
		input = {
			enabled = true,
		},
		select = {
			enabled = true,
			backend = "telescope",
			trim_prompt = true,
		},
	})
end

return config
