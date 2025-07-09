-- regen100/cmake-language-server
-- https://github.com/regen100/cmake-language-server
--
-- Configuration of the "cmake-language-server" LSP server.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
}

vim.lsp.config("cmake", settings)
