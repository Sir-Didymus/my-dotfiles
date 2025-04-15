-- Configure the "lua_ls" lsp server.

local cmp_nvm_lsp = require("cmp_nvim_lsp")
local on_attach = require("util.lsp").on_attach
local capabilities = cmp_nvm_lsp.default_capabilities()

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
