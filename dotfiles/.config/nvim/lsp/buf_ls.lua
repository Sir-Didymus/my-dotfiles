-- bufbuild/buf
-- https://github.com/bufbuild/buf
--
-- Configuration of the "buf" LSP server.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
}

vim.lsp.config("buf_ls", settings)
