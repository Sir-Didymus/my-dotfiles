-- folke/trouble.nvim
--
-- A pretty list for showing diagnostics, references, telescope results, quickfix and
-- location lists to help you solve all the trouble your code is causing.

return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>ttd",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Toggle Trouble Diagnostics",
		},
		{
			"<leader>tts",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Toggle Trouble Symbols",
		},
		{
			"<leader>ttls",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "Toggle Trouble LSP Definitions / references / ...",
		},
		{
			"<leader>ttlo",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Toggle Trouble Location List",
		},
	},
}
