-- Configure the "rust_analyzer" lsp server.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			allFeatures = true,
			checkOnSave = {
				command = "clippy",
			},
		},
	},
}

vim.lsp.config("rust_analyzer", settings)
