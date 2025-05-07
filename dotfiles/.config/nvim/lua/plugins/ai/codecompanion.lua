-- olimorris/codecompanion.nvim
--
-- CodeCompanion is a productivity tool which streamlines how you develop with LLMs, in Neovim.

local config = function()
	-- Set keybinding to show codecompanion actions
	vim.keymap.set("n", "<leader>cca", ":CodeCompanionActions<CR>", { desc = "Show CodeCompanion Actions" })

	require("codecompanion").setup({})
end

return {
	"olimorris/codecompanion.nvim",
	config = config,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
