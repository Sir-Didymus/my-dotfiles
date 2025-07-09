-- LuaLS/lua-language-server
-- https://github.com/LuaLS/lua-language-server
--
-- Configuration of the "lua-language-server" LSP server.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			diagnostics = {
				-- make language server recognize "vim" global
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		},
	},
}

vim.lsp.config("html", settings)
