-- eclipse/eclipse.jdt.ls
-- https://projects.eclipse.org/projects/eclipse.jdt.ls
--
-- Configuration of the "jdtls" LSP server (Java). Relies on nvim-lspconfig's
-- shipped defaults for cmd/filetypes/root_markers, which already handle
-- per-project workspace directories.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
}

return settings
