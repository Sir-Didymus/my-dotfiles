-- neovim/nvim-lspconfig
--
-- nvim-lspconfig is a "data only" repository,
-- providing basic, default Nvim LSP client configurations for various LSP servers.

-- configure nvim-lspconfig
local config = function()
	-- enable LSPs
	vim.lsp.enable("basedpyright")
	vim.lsp.enable("clangd")
	vim.lsp.enable("cssls")
	vim.lsp.enable("cmake")
	vim.lsp.enable("efm")
	vim.lsp.enable("html")
	vim.lsp.enable("lua_ls")
	vim.lsp.enable("rust_analyzer")
  vim.lsp.enable("sqls")
	vim.lsp.enable("texlab")
	vim.lsp.enable("taplo")
end

return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = config,
	opts = {
		inlay_hints = { enabled = true },
	},
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"Sir-Didymus/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
