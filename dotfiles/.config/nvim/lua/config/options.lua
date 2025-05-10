---------------------
-- Set vim options --
---------------------

-----------------------
-- Tab / indentation --
-----------------------

-- This setting tells Vim how many columns a tab should be made up of in the editor view.
-- It takes care only of how tabs will be rendered and has no effect on the actual text.
vim.opt.tabstop = 2

-- Set a value for this option to control how many columns text will be indented when using
-- indent operations (such as << or >>) in normal or visual mode;
-- this also covers automatic C-style indentation.
vim.opt.shiftwidth = 2

-- Affects the behavior of the tab and backspace keys.
-- It specifies the amount of whitespace to be inserted when the tab key is pressed;
-- and the amount to be removed when the backspace key is pressed.
vim.opt.softtabstop = 2

-- Determines whether Vim should use spaces or tabs when executing a whitespace command or when the tab key is pressed.
vim.opt.expandtab = true

-- Copy indent from current line when starting a new line.
vim.opt.autoindent = true

-- Automatically inserts one extra level of indentation in some cases, and works for C-like files.
vim.opt.smartindent = true

-- Wraps text instead of forcing a horizontal scroll.
-- This is the Vim default.
vim.opt.wrap = false

------------
-- Search --
------------

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

----------------
-- Appearance --
----------------

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- Keeps curser centered vertically when scrolling.
vim.opt.scrolloff = 10

-- Sets vim's line length marker.
vim.opt.colorcolumn = "100"

-- Enables the signcolumn.
vim.opt.signcolumn = "yes"

--------------
-- Behavior --
--------------

vim.opt.hidden = true
vim.opt.clipboard:append("unnamedplus")
