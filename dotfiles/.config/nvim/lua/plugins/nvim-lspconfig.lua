
local config = function()
  local lspconfig = require("lspconfig")

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
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  end

  ----------------------------
  -- lua ---------------------
  ----------------------------
  lspconfig.lua_ls.setup {
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
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
    "creativenull/efmls-configs-nvim",
  }
}
