----------------------------------------------------------------------------------------------------
-- williamboman/mason-lspconfig
--
-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
----------------------------------------------------------------------------------------------------

local opts = {
	ensure_installed = {
		"efm",
		"lua_ls",
		"clangd",
    "pyright",
    "ruff",
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	dependencies = "williamboman/mason.nvim",
}
