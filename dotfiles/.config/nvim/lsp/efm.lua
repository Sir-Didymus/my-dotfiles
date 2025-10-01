-- mattn/efm-langserver
-- https://github.com/mattn/efm-langserver
--
-- Configuration of the "efm-langserver" LSP server.
--
-- Efm is a general purpose language server that I use to run linters and formatters
-- through the language server protocol in nvim.
--
-- I use [efml-configs](https://github.com/creativenull/efmls-configs-nvim), which provides default
-- configurations for a lot of formatters and liners.

-------------------------
-- Require efm configs --
-------------------------

-- Prettier_d - Works for many languages
local prettier_d = require("efmls-configs.formatters.prettier_d")

-- Protobuf
local buf_lint = require("efmls-configs.linters.buf")
local buf_format = require("efmls-configs.formatters.buf")

-- C / Cpp
local clangformat = require("efmls-configs.formatters.clang_format")
local clangtidy = require("efmls-configs.linters.clang_tidy")

-- HTML / CSS
local stylelint = require("efmls-configs.linters.stylelint")

-- Lua
local stylua = require("efmls-configs.formatters.stylua")
local luacheck = require("efmls-configs.linters.luacheck")

-- Markdown
local default_markdownlint = require("efmls-configs.linters.markdownlint")
local markdownlint = vim.tbl_extend("force", default_markdownlint, {
	lintCommand = "markdownlint --stdin -c $HOME/.config/nvim/markdownlint.json",
})

-- Python
local black = require("efmls-configs.formatters.black")
local ruff = require("efmls-configs.linters.ruff")

-- Rust
local rustfmt = require("efmls-configs.formatters.rustfmt")

-- SQL
local sqlfluff = require("efmls-configs.linters.sqlfluff")
local sqruff = require("efmls-configs.formatters.sqruff")

-- Tex
local latexindent = require("efmls-configs.formatters.latexindent")

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
		"sql",
		"tex",
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
			sql = { sqruff, sqlfluff },
			tex = { latexindent },
			yaml = { prettier_d, yamllint },
			protobuf = { buf_format, buf_lint },
		},
	},
}

vim.lsp.config("efm", efm_settings)
