
----------------------------------------------------------------------------------------------------
--- lewis6991/gitsigns
---
--- Deep buffer integration for Git.
----------------------------------------------------------------------------------------------------

return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  config = function()
    require("gitsigns").setup()
  end
}
