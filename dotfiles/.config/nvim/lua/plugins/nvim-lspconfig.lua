
-- configure nvim-lspconfig
local config = function()
  local cmp_nvm_lsp = require("cmp_nvim_lsp")
  local lspconfig = require("lspconfig")
  local capabilities = cmp_nvm_lsp.default_capabilities()

  ----------------------------
  -- Signs for diagnostics ---
  ----------------------------
  local diagnostic_signs = { Error = "", Warn = "", Hint = "ﴞ", Info = ""}
  for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

  local on_attach = function(client, bufnr)
    -- keybind options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- peek definition
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  end

  ----------------------------
  -- lua ---------------------
  ----------------------------
  lspconfig.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
      Lua = {
        diagnostics = {
        -- make language server recognize "vim" global
          globals = {"vim"},
       },
        workspace = {
          -- make language server aware of runtime files
          library = {
            vim.env.VIMRUNTIME,
          },
        },
      },
    },
  }

  ----------------------------
  -- C / C++ -----------------
  ----------------------------
  lspconfig.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  ----------------------------
  -- Require efm configs -----
  ----------------------------
  local luacheck = require("efmls-configs.linters.luacheck")
  local stylua = require("efmls-configs.formatters.stylua")

  ----------------------------
  -- configure efm server ----
  ----------------------------
  lspconfig.efm.setup {
    filetypes = {
      "lua",
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = true,
      documentSymbol = true,
      codeAction = true,
      completion = true,
    },
    settings = {
      languages = {
        lua = { luacheck, stylua },
      },
    },
  }

end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
    "creativenull/efmls-configs-nvim",
    "hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
  }
}
