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

-- Keeps cursor centered vertically when scrolling.
vim.opt.scrolloff = 10

-- Sets vim's line length marker.
vim.opt.colorcolumn = "100"

-- Enables the signcolumn.
vim.opt.signcolumn = "yes"

--------------
-- Behavior --
--------------

-- When off, a buffer is unloaded when it is abandoned.
-- When on, a buffer becomes hidden when it is abandoned.
vim.opt.hidden = true

vim.opt.clipboard:append("unnamedplus")

-- When on, splitting a window with `:split` will put the new window below the current one.
vim.opt.splitbelow = true

-- When on, splitting a window with `:vsplit` will put the new window right of the current one.
vim.opt.splitright = true

----------------
-- Spellcheck --
----------------

-- When on spell checking will be done.
vim.opt.spell = true

-- A comma-separated list of word list names.
-- When the 'spell' option is on spellchecking will be done for these languages.
vim.opt.spelllang = "en_us,de_de"

-- Name of the word list file where words are added for the `zg` and `zw` commands.
vim.opt.spellfile = vim.fn.expand("~/.config/nvim/spell/custom.add")
