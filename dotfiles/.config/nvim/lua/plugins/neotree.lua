
-- Neo-tree is a Neovim plugin to browse the file system and other tree like structures in whatever style suits you,
-- including sidebars, floating windows, netrw split style, or all of them at once!

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
}
