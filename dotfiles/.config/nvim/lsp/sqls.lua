-- sqls-server/sqls
-- https://github.com/sqls-server/sqls
--
-- Configuration for the "sqls" LSP server.
--
-- Languages: SQL
-- Requirements: Go

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
}

vim.lsp.config("sqls", settings)
