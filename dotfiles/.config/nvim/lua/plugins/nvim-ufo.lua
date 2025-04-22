-- kevinhwang91/nvim-ufo
--
-- The goal of nvim-ufo is to make Neovim's fold look modern and keep high performance.

local config = function()
	-- Configure vim folding options.
	vim.o.foldcolumn = "1"
	vim.o.foldlevel = 99 -- Using ufo provider needs a large value, feel free to decrease the value.
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true

	-- Using ufo provider needs remap `zR` and `zM`.
	vim.keymap.set("n", "zR", require("ufo").openAllFolds)
	vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

	require("ufo").setup()
end

return {
	"kevinhwang91/nvim-ufo",
	config = config,
	dependencies = {
		"kevinhwang91/promise-async",
	},
}
