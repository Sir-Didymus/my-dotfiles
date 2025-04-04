----------------------------------------------------------------------------------------------------
-- windwp/nvim-ts-autotag
--
-- Use treesitter to autoclose and autorename html tags.
----------------------------------------------------------------------------------------------------

local config = function()
	require("nvim-ts-autotag").setup()
end

return {
	"windwp/nvim-ts-autotag",
	lazy = false,
	config = config,
}
