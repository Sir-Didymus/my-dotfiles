-- williamboman/mason-lspconfig
--
-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.

local opts = {
	ensure_installed = {
		"basedpyright",
		"cssls",
		"clangd",
    --"cmake-language-server",
		"efm",
		"html",
		"jdtls",
		"jinja_lsp",
		"lua_ls",
		"ruff",
		"rust_analyzer",
		-- "metals" is not available via Mason; install the prebuilt artifact via
		-- coursier instead (AUR: coursier-bin):
		--   cs install metals
		"sqls",
		"taplo",
		"texlab",
		--"buf_ls",
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	dependencies = "williamboman/mason.nvim",
}
