
return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- To use existing VS Code style snippets from a plugin
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Configure vim completion options
    vim.opt.completeopt = "menu,menuone,noselect"

    -- Setup nvim-cmp
    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ -- accept currently selected item
          -- set select to false to only confirm explicitly selected items
          select = false
        }),
      }),
			-- sources for autocompletion
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- lsp
        { name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
      }),
    })
  end,
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
    },
  },
}
