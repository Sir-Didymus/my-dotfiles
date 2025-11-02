-------------------------------------------------------------------
-- Contains the on_attach function used in the lsp configuration --
-------------------------------------------------------------------

local M = {}

M.on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybindings
	vim.keymap.set("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", opts) -- open finder
	vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- peek definition
	vim.keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to definition
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	vim.keymap.set("x", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions for selected visual range
	vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostics for line
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename

	-- Inlay hints
	if client.server_capabilities.inlayHintProvider then
		-- If Server supports inlay hints, activate them for the current buffer.
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end

	-- Formatting with efm
	if client.name == "efm" then
		vim.keymap.set("n", "<leader>fe", function()
			vim.lsp.buf.format({ name = "efm", async = true })
		end, { desc = "Format file with efm" }) -- Add description for which-key
	end

	-- Formatting with lsp
	if client.name ~= "efm" and client.supports_method("textDocument/formatting") then
		vim.keymap.set("n", "<leader>fl", function()
			vim.lsp.buf.format({
				name = client.name,
				async = true,
			})
		end, { desc = "Format file with LSP" }) -- Add description for which-key
	end

	-- Disable semantic tokens
	-- if client.name == "buf_ls" then
	-- 	client.server_capabilities.semanticTokensProvider = nil
	-- end
end

return M
