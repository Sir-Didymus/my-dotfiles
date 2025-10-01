-- WhoIsSethDaniel/mason-tool-installer
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
--
-- Installs and upgrades third-party tools.

return {
  "WhoIsSethDaniel/mason-tool-installer",
  dependencies = {
    "Williamboman/mason.nvim",
  },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- Multi-language
        "prettierd",

        -- HTML / CSS
        "stylelint",

        -- Lua
        "stylua",
        "luacheck",

        -- Markdown
        "markdownlint",

        -- Python
        "black",
        "ruff",

        -- Rust
        "rustfmt",

        -- SQL
        "sqlfluff",
        "sqruff",

        -- Yaml
        "yamllint",

        -- CMake
        "gersemi",

        -- Json
        "jsonlint",

        -- Latex
        "latexindent"
      },
      auto_update = true,
      run_on_start = true,
    })
  end,
}
