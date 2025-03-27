
local config = function()
  require("lualine").setup {
    options = {
      cions_enabled = true,
      theme = "auto",
    },
    sections = {
      lualine_a = {
        {"buffers"}
      }
    },
  }
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = config,
}
