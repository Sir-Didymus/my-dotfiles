-- nvim-lualine/lualine
--
-- A blazing fast and easy to configure Neovim statusline written in Lua.

local config = function()
	require("lualine").setup({
		options = {
			icions_enabled = true,
			theme = "auto",
		},
		sections = {
			lualine_a = {
				{ "buffers" },
			},
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = config,
}
