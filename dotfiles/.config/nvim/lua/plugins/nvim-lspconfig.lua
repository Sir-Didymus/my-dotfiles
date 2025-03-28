
local config = function()
  local lspconfig = require("lspconfig")

  local diagnostic_signs = { Error = "", Warn = "", Hint = "ﴞ", Info = ""}
  for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end


  ----------------------------
  -- lua ---------------------
  ----------------------------
  lspconfig.lua_ls.setup{}
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim"
  }
}
