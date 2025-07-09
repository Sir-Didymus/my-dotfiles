-- DetachHead/basedpyright
-- https://github.com/DetachHead/basedpyright
--
-- Configuration of the "basedpyright" LSP server.
--
-- A fork of pyright.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		basedpyright = {
			disableOrganizeImports = false,
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				autoImportCompletions = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
}

vim.lsp.config("basedpyright", settings)
