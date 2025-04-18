-----------------
-- Set keymaps --
-----------------

local keymap = vim.keymap

local opts = { noremap = true, silent = true }

--------------------------
-- Directory Navigation --
--------------------------

keymap.set("n", "<leader>n", ":Neotree toggle<CR>", opts)
keymap.set("n", "<leader>m", ":Neotree focus<CR>", opts)

---------------------
-- Pane Navigation --
---------------------

keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate Left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate Right

------------------------
-- Wiindow Management --
------------------------

keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontally
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Toggle Minimize

---------------
-- Indenting --
---------------

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
