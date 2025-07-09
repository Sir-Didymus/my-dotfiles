-- rust-lang/rust-analyzer
-- https://github.com/rust-lang/rust-analyzer
--
-- Configuration of the "rust-analyzer" LSP server.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			allFeatures = true,
			checkOnSave = true,
			check = {
				command = "clippy",
			},
		},
	},
}

vim.lsp.config("rust_analyzer", settings)
