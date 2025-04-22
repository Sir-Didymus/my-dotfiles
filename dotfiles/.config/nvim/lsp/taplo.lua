-- Configure the "taplo" lsp server.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

-- IMPORTANT: this is required for taplo LSP to work in non-git repositories
local root_markers = function(name, _)
	local patterns = { ".git", "*.toml" }
	for _, pattern in ipairs(patterns) do
		if vim.glob.to_lpeg(pattern):match(name) ~= nil then
			return true
		end
	end
	return false
end

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
	root_markers = root_markers,
	filetypes = { "toml" },
}

vim.lsp.config("taplo", settings)
