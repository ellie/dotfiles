local set = vim.opt

vim.o.termguicolors = true
vim.cmd [[colorscheme gruvbox-flat]]

set.number = true
set.relativenumber = true
set.colorcolumn = '80' -- a string? why?

require('lualine').setup{
	options = {
		theme = "gruvbox"
	}
}
