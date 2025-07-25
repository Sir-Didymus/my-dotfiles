-----------------
-- Set keymaps --
-----------------

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-----------------------
-- Buffer Navigation --
-----------------------
keymap.set("n", "<leader>bn", ":bnext<CR>") -- Next buffer
keymap.set("n", "<leader>bp", ":bprevious<CR>") -- Prev buffer
keymap.set("n", "<leader>bd", ":bd<CR>") -- Delete this buffer
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts) -- Find buffer

--------------------------
-- Directory Navigation --
--------------------------

keymap.set("n", "<leader>n", ":Neotree toggle<CR>", opts) -- Toggle NeoTree
keymap.set("n", "<leader>m", ":Neotree focus<CR>", opts) -- Focus NeoTree

---------------------
-- Pane Navigation --
---------------------

keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate Left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate Right

------------------------
-- Window Management --
------------------------

keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontally
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Toggle Minimize

---------------
-- Indenting --
---------------

keymap.set("v", "<", "<gv") -- Indent Left
keymap.set("v", ">", ">gv") -- Indent Right

---------
-- Lsp --
---------

-- Toggle all lsp diagnostics on/off (this does not stop lsp servers, it only hides diagnostics)
keymap.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle all lsp diagnostics", noremap = true, silent = true })

--------------
-- Spelling --
--------------

keymap.set("n", "<leader>ss", function()
	vim.opt.spell = not vim.opt.spell:get()
end, { desc = "Toggle spell checking" })

vim.api.nvim_create_user_command("BatchRenameBase58", function()
	require("util.rename").BatchRenameBase58()
end, {})

