----------------------------------------------------------------------------------------------------
-- nvim-treesitter/nvim-treesitter
--
-- Treesitter is a new parser generator tool that we can use in Neovim
-- to power faster and more accurate syntax highlighting.
----------------------------------------------------------------------------------------------------

local config = function()
	require("nvim-treesitter.configs").setup({
		version = false, -- last release is way too old and doesn't work on Windows
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
			"cpp",
      "css",
			"gitignore",
			"html",
      "javascript",
			"lua",
			"luadoc",
			"make",
			"markdown",
			"markdown_inline",
      "prolog",
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
