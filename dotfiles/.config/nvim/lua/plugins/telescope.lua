-- nvim-telescope/telescope
-- https://github.com/nvim-telescope/telescope.nvim
--
-- Telescope is a highly extendable fuzzy finder over lists.

local keymap = vim.keymap

local config = function()
	local telescope = require("telescope")
  local builtin = require("telescope.builtin")
  local actions = require("telescope.actions")

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

  -- Set up keymaps
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
		keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope Live Grep" })
		keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope Buffers" })
		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope Help Tags" })
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.1",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
}
