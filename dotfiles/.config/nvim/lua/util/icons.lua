--------------------------------------
-- Icons used in the configuration. --
--------------------------------------

local M = {}

M.diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = M.diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = M.diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = M.diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = M.diagnostic_signs.Hint,
		},
	},
})
