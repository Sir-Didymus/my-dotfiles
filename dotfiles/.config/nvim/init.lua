
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.cmd("set expandtab") -- Use spaces instead of tabs
vim.cmd("set tabstop=4") -- Number of spaces a tab represents
vim.cmd("set shiftwidth=4") -- Number of spaces used for indentation
vim.cmd("set clipboard+=unnamedplus") -- Enable clipboard
vim.cmd("set number")
vim.cmd("set relativenumber")

vim.keymap.set('n', '<leader>n', ':Neotree toggle<CR>')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

--------------------------
-- Setup lazy.nvim -------
--------------------------

require("lazy").setup({
    spec = {
        -- plugins
        { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
            }
        }
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

--------------------------
-- Setup catppuccin ------
--------------------------

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

--------------------------
-- Setup treesitter ------
--------------------------

local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {"lua", "c", "vim", "markdown"},
    highlight = { enable = true },
    indent = { enable = true }, 
})
