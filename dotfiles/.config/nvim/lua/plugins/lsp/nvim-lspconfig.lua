-- neovim/nvim-lspconfig
--
-- nvim-lspconfig is a "data only" repo,
-- providing basic, default Nvim LSP client configurations for various LSP servers.

-- configure nvim-lspconfig
local config = function()
	-- enable lsps
	vim.lsp.enable("html")
	vim.lsp.enable("efm")
	vim.lsp.enable("basedpyright")
	vim.lsp.enable("clangd")
	vim.lsp.enable("lua_ls")
	vim.lsp.enable("cssls")
	vim.lsp.enable("texlab")
	vim.lsp.enable("taplo")
	vim.lsp.enable("cmake")
  vim.lsp.enable("rust_analyzer")
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
