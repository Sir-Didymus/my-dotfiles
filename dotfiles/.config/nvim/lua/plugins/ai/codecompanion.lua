-- olimorris/codecompanion.nvim
--
-- CodeCompanion is a productivity tool which streamlines how you develop with LLMs, in Neovim.

local config = function()
	-- Set keybinding to show codecompanion actions
	vim.keymap.set(
		"n",
		"<leader>cca",
		"<cmd>CodeCompanionActions<cr>",
		{ desc = "Show CodeCompanion Actions", noremap = true, silent = true }
	)
	vim.keymap.set(
		{ "n", "v" },
		"<leader>cct",
		"<cmd>CodeCompanionChat Toggle<cr>",
		{ desc = "Toggle CodeCompanion", noremap = true, silent = true }
	)

	require("codecompanion").setup()
end

return {
	"olimorris/codecompanion.nvim",
	config = config,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/codecompanion-history.nvim",
	},
}
