-- windwp/nvim-ts-autotag
--
-- Use treesitter to autoclose and autorename html tags.

return {
	"windwp/nvim-ts-autotag",
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
	lazy = false,
}
