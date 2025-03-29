
local opts = {
  ensure_installed = {
    "efm",
    "lua_ls",
    "clangd",
  },
  automatic_installation = true,
}

return {
    "williamboman/mason-lspconfig.nvim",
    opts = opts,
    dependencies = "williamboman/mason.nvim",
}
