-- microsoft/vscode-css-languageservice
-- https://github.com/microsoft/vscode-css-languageservice
--
-- Configuration of the "vscode-css-languageservice" LSP server.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
}

vim.lsp.config("cssls", settings)
