-- nvim-flutter/flutter-tools
-- https://github.com/nvim-flutter/flutter-tools.nvim

local config = function()
	local on_attach = require("util.lsp").on_attach
	local capabilities = require("util.capabilities").capabilities()

	-- Fix for dynamic registration of formatting capability in nvim 0.10+
	-- See: https://github.com/nvim-flutter/flutter-tools.nvim/issues/351
	capabilities.textDocument.formatting = {
		dynamicRegistration = false,
	}

	require("flutter-tools").setup({
		lsp = { on_attach = on_attach, capabilities = capabilities },
	})
end

return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = config,
}
