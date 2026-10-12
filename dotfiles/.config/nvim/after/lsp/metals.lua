-- scalameta/metals
-- https://scalameta.org/metals/
--
-- Configuration of the "metals" LSP server (Scala).
--
-- Metals is not available through Mason (and the AUR "metals" package builds
-- from source via sbt, which breaks under newer JDKs). Install the prebuilt
-- artifact via coursier instead (AUR: coursier-bin):
--   cs install metals

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
	capabilities = capabilities,
	on_attach = on_attach,
	init_options = {
		statusBarProvider = "show-message",
	},
}

return settings
