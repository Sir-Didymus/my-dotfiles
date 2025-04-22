-- Configure the "texlab" lsp server.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		texlab = {
			diagnostics = {
				enabled = true,
			},
		},
	},
}

vim.lsp.config("texlab", settings)
