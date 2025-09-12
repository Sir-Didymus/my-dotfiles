-- lervag/vimtex
-- https://github.com/lervag/vimtex
--
-- A modern vim and neovim filetype plugin for LaTeX files.

return {
	"lervag/vimtex",
	lazy = false, -- We don't want to lazy load VimTeX
	init = function()
		vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = ".aux"
    }
	end,
}
