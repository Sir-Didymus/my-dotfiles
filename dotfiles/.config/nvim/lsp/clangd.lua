-- Configure the "clangd" lsp server.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = {
		"clangd",
	},
}

vim.lsp.config("clangd", settings)
