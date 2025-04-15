-- Configure the "efm" lsp server.

-------------------------
-- Require efm configs --
-------------------------

-- lua
local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")

-- C / Cpp
local clangtidy = require("efmls-configs.linters.clang_tidy")
local clangformat = require("efmls-configs.formatters.clang_format")

-- html / css
local prettier_d = require("efmls-configs.formatters.prettier_d")

-- Python
local ruff = require("efmls-configs.linters.ruff")
local black = require("efmls-configs.formatters.black")

--------------------------
-- Configure efm server --
--------------------------

local cmp_nvm_lsp = require("cmp_nvim_lsp")
local on_attach = require("util.lsp").on_attach
local capabilities = cmp_nvm_lsp.default_capabilities()

local efm_settings = {
	cmd = { "efm-langserver" },
	single_file_support = true,
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {
		"lua",
		"c",
		"cpp",
		"css",
		"h",
		"html",
		"hpp",
		"python",
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
			html = { prettier_d },
			css = { prettier_d },
			python = { ruff, black },
		},
	},
}

vim.lsp.config("efm", efm_settings)
