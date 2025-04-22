-- Configure the "efm" lsp server.

-------------------------
-- Require efm configs --
-------------------------

-- C / Cpp
local clangtidy = require("efmls-configs.linters.clang_tidy")
local clangformat = require("efmls-configs.formatters.clang_format")

-- Html / Css
local prettier_d = require("efmls-configs.formatters.prettier_d")
local stylelint = require("efmls-configs.linters.stylelint")

-- Lua
local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")

-- Markdown
local markdownlint = require("efmls-configs.linters.markdownlint")

-- Python
local ruff = require("efmls-configs.linters.ruff")
local black = require("efmls-configs.formatters.black")

-- Yaml
local yamllint = require("efmls-configs.linters.yamllint")

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
		"h",
		"html",
		"hpp",
		"lua",
		"markdown",
		"python",
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
			html = { prettier_d },
			lua = { luacheck, stylua },
			markdown = { prettier_d, markdownlint },
			python = { ruff, black },
      yaml = { prettier_d, yamllint },
		},
	},
}

vim.lsp.config("efm", efm_settings)
