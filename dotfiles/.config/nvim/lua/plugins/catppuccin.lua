
----------------------------------------------------------------------------------------------------
--- catppuccin/nvim
---
--- Catpuccin theme for neovim.
----------------------------------------------------------------------------------------------------

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end
}
