-- microsoft/vscode-json-languageservice
-- https://github.com/microsoft/vscode-json-languageservice
--
-- Configuration of the "vscode-json-languageservice" LSP server.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
}

vim.lsp.config("json-ls", settings)
