-- microsoft/vscode-html-languageservice
-- https://github.com/microsoft/vscode-html-languageservice
--
-- Configuration of the "vscode-html-languageservice" LSP server.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
}

vim.lsp.config("html", settings)
