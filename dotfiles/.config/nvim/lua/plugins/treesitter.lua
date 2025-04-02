----------------------------------------------------------------------------------------------------
-- nvim-treesitter/nvim-treesitter
--
-- Treesitter is a new parser generator tool that we can use in Neovim
-- to power faster and more accurate syntax highlighting.
----------------------------------------------------------------------------------------------------

return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"gitignore",
			"html",
			"lua",
			"luadoc",
			"lua patterns",
			"make",
			"markdown",
			"markdown_inline",
			"toml",
			"xml",
			"vim",
			"vimdoc",
			"yaml",
		},
	},
}
