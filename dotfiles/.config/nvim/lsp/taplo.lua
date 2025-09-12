-- tamasfe/taplo
-- https://github.com/tamasfe/taplo
--
-- Configuration of the "taplo" LSP server.
--
-- Languages: TOML

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
	root_markers = { ".git" },
	filetypes = { "toml" },
}

vim.lsp.config("taplo", settings)
