-- clangd/clangd
-- https://github.com/clangd/clangd
--
-- Configuration of the "clangd" LSP server.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp", "h" },
	on_attach = on_attach,
	cmd = {
		"clangd",
	},
}

vim.lsp.config("clangd", settings)
