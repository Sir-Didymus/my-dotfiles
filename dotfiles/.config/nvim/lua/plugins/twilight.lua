-- folke/twilight.nvim
--
-- Dims inactive portions of the code you're editing.

local config = function()
	-- Set keybindings to toggle twilight
	vim.keymap.set("n", "<leader>tw", ":Twilight<CR>", { desc = "Toggle Twiglight Mode" })

	require("twilight").setup({
		context = 10, -- amount of lines we will try to show around the current line
		treesitter = true, -- use treesitter when available for the filetype
		-- treesitter is used to automatically expand the visible text,
		-- but you can further control the types of nodes that should always be fully expanded
		expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
			"function",
			"method",
			"table",
			"if_statement",
		},
	})
end

return {
	"folke/twilight.nvim",
	config = config,
}
