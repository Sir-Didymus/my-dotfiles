---------------------------------------------------------------------------------------------------
-- brenoprata10/nvim-highlight-colors"
--
-- Highlight colors within Neovim.
----------------------------------------------------------------------------------------------------

return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		vim.opt.termguicolors = true
		require("nvim-highlight-colors").setup({})
	end,
}
