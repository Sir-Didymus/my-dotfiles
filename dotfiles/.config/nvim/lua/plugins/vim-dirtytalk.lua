-- psliwka/vim-dirtytalk
-- https://github.com/psliwka/vim-dirtytalk
--
-- Spellcheck dictionary for programmers.

return {
	"psliwka/vim-dirtytalk",
	build = ":DirtytalkUpdate",
	config = function()
		vim.opt.spelllang = { "en_us", "de_de", "programming" }
	end,
}
