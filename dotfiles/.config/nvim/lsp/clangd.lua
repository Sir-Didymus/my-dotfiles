-- Configure the "clangd" lsp server.

local cmp_nvm_lsp = require("cmp_nvim_lsp")
local on_attach = require("util.lsp").on_attach
local capabilities = cmp_nvm_lsp.default_capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = {
		"clangd",
	},
}

vim.lsp.config("clangd", settings)
