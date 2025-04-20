-- Configure the "texlab" lsp server.

local cmp_nvm_lsp = require("cmp_nvim_lsp")
local on_attach = require("util.lsp").on_attach
local capabilities = cmp_nvm_lsp.default_capabilities()

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
