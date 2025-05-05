-- nvim-telescope/telescope
--
-- telescope.nvim is a highly extendable fuzzy finder over lists.

local keymap = vim.keymap
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
				},
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" }),
		keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" }),
		keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" }),
		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" }),
	},
}
