
----------------------------------------------------------------------------------------------------
-- Contains the on_attach function used in the lsp configuration.
----------------------------------------------------------------------------------------------------

local M = {}

M.on_attach = function (_client, bufnr)

    -- keybind options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybindings
    vim.keymap.set("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", opts) -- open finder
    vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- peek definition
	  vim.keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to definition
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
    vim.keymap.set("n","<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
end

return M
