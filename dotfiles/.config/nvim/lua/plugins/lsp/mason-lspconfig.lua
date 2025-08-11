-- williamboman/mason-lspconfig
--
-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.

local opts = {
	ensure_installed = {
		"basedpyright",
		"cssls",
		"clangd",
		"cmake",
		"efm",
		"html",
		"lua_ls",
		"ruff",
		"rust_analyzer",
		"sqls",
		"taplo",
		"texlab",
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	dependencies = "williamboman/mason.nvim",
}
