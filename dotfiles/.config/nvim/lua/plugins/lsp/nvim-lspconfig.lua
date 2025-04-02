----------------------------------------------------------------------------------------------------
-- nvim-lspconfig
--
-- nvim-lspconfig is a "data only" repo,
-- providing basic, default Nvim LSP client configurations for various LSP servers.
----------------------------------------------------------------------------------------------------

local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.icons").diagnostic_signs

-- configure nvim-lspconfig
local config = function()
	local cmp_nvm_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")
	local capabilities = cmp_nvm_lsp.default_capabilities()

	--------------------------------------------------------------------------------------------------
	-- lua
	--------------------------------------------------------------------------------------------------
	lspconfig.lua_ls.setup({
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
	})

	--------------------------------------------------------------------------------------------------
	-- C / C++
	--------------------------------------------------------------------------------------------------
	lspconfig.clangd.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		cmd = {
			"clangd",
		},
	})

	--------------------------------------------------------------------------------------------------
	-- Signs for diagnostics
	--------------------------------------------------------------------------------------------------
	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	--------------------------------------------------------------------------------------------------
	-- Require efm configs
	--------------------------------------------------------------------------------------------------

	-- lua
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	-- C / Cpp
	local clangtidy = require("efmls-configs.linters.clang_tidy")
	local clangformat = require("efmls-configs.formatters.clang_format")

	--------------------------------------------------------------------------------------------------
	-- Configure efm server
	--------------------------------------------------------------------------------------------------
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"c",
			"cpp",
			"h",
			"hpp",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			rootMarkers = { ".git/" },
			languages = {
				lua = { luacheck, stylua },
				c = { clangformat, clangtidy },
				cpp = { clangformat, clangtidy },
			},
		},
	})
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
