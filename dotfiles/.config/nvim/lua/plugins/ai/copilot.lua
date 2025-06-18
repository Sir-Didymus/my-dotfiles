-- zbirenbaum/copilot.lua
--
-- Replacement for copilot.vim.

return {
	"zbirenbaum/copilot.lua",
	enabled = false, -- disables copilot by default
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			-- It is recommended to disable copilot.lua's suggestion and panel modules,
			-- as they can interfere with completions properly appearing in copilot-cmp.
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
}
