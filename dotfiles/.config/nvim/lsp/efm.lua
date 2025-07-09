-- mattn/efm-langserver
-- https://github.com/mattn/efm-langserver
--
-- Configuration of the "efm-langserver" LSP server.
--
-- Efm is a general purpose language server that I use to run linters and formatters
-- through the language server protocol in nvim.

-------------------------
-- Require efm configs --
-------------------------

-- Prettier_d - Works for many languages
local prettier_d = require("efmls-configs.formatters.prettier_d")

-- C / Cpp
local clangformat = require("efmls-configs.formatters.clang_format")
local clangtidy = require("efmls-configs.linters.clang_tidy")

-- HTML / CSS
local stylelint = require("efmls-configs.linters.stylelint")

-- Lua
local stylua = require("efmls-configs.formatters.stylua")
local luacheck = require("efmls-configs.linters.luacheck")

-- Markdown
local markdownlint = require("efmls-configs.linters.markdownlint")

-- Python
local black = require("efmls-configs.formatters.black")
local ruff = require("efmls-configs.linters.ruff")

-- Rust
local rustfmt = require("efmls-configs.formatters.rustfmt")

-- Yaml
local yamllint = require("efmls-configs.linters.yamllint")

-- CMake
local gersemi = require("efmls-configs.formatters.gersemi")

-- Json
local jsonlint = require("efmls-configs.linters.jsonlint")

--------------------------
-- Configure efm server --
--------------------------

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local efm_settings = {
	root_markers = { ".git/", ".luarc.json", ".luarc.jsonc" },
	cmd = { "efm-langserver" },
	single_file_support = true,
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {
		"c",
		"cpp",
		"css",
		"cmake",
		"h",
		"html",
		"json",
		"hpp",
		"lua",
		"markdown",
		"python",
		"rust",
		"yaml",
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
			c = { clangformat, clangtidy },
			cpp = { clangformat, clangtidy },
			css = { prettier_d, stylelint },
			cmake = { gersemi },
			html = { prettier_d },
			json = { prettier_d, jsonlint },
			lua = { stylua, luacheck },
			markdown = { prettier_d, markdownlint },
			python = { black, ruff },
			rust = { rustfmt },
			yaml = { prettier_d, yamllint },
		},
	},
}

vim.lsp.config("efm", efm_settings)
