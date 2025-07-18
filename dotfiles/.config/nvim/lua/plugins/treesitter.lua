-- nvim-treesitter/nvim-treesitter
--
-- Treesitter is a new parser generator tool that we can use in Neovim
-- to power faster and more accurate syntax highlighting.

local config = function()
	require("nvim-treesitter.configs").setup({
		version = false, -- last release is way too old
		build = ":TSUpdate",
		autotag = { enable = false },
		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-s>",
				node_incremental = "<C-s>",
				scope_incremental = false,
				node_decremental = "<BS>",
			},
		},
		ensure_installed = {
			"bash",
			"c",
      "cmake",
			"cpp",
			"css",
      "comment", -- Treesitter grammar for comment tags like TODO, FIXME, etc.
      "doxygen", -- Treesitter grammar for doxygen comments.
			"gitignore",
			"html",
      "http",
      "ini",
			"javascript",
      "json",
      "latex",
			"lua",
			"luadoc",
			"make",
			"markdown",
			"markdown_inline",
			"prolog",
      "python",
      "rust",
			"toml",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		},
	})
end
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = config,
}
