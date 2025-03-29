
-- Neo-tree is a Neovim plugin to browse the file system and other tree like structures in whatever style suits you,
-- including sidebars, floating windows, netrw split style, or all of them at once!

local config = function()
  require("neo-tree").setup {
    filesystem = {
      filtered_items = {
        visible = true, -- when true, they will just be displayed differently than normal item
      },
    },
  }
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  config = config,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
}
