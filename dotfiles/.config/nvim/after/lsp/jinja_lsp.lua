-- uros-5/jinja-lsp
-- https://github.com/uros-5/jinja-lsp
-- Configuration of the "jinja_lsp" LSP server.

local on_attach = require("util.lsp").on_attach
local capabilities = require("util.capabilities").capabilities()

local settings = {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "jinja", "jinja.html" },
}

return settings
