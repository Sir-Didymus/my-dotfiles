-- akinsho/bufferline.nvim
--
-- Buffer line (with tabpage integration) for NeoVim.

local config = function()
	-- This plugins needs termguicolors to be able to work,
	-- as it reads the hex gui color values of various highlight groups.
	vim.opt.termguicolors = true

	require("bufferline").setup()
end

return {
	"akinsho/bufferline.nvim",
	version = "*",
	config = config,
	dependencies = "nvim-tree/nvim-web-devicons",
}
