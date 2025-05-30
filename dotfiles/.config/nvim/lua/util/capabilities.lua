-------------------------------------------------------
-- Contains function to get the default capabilities --
-------------------------------------------------------

local M = {}

M.capabilities = function()
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local capabilities = cmp_nvim_lsp.default_capabilities()
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}
	return capabilities
end

return M
