local map = function(key)
	local opts = {noremap = true}

	for i, v in pairs(key) do
		if type(i) == 'string' then opts[i] = v end
	end

	vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
end

-- use space as the leader key
vim.g.mapleader = ' '

-- fastest way to save
map {'n', '<Leader>w', ':write<CR>'}

-- muscle memory for me
map {'i', 'jj', '<esc>'}

-- find files
map {'n', '<Leader>ff', ':Telescope find_files<CR>'}

-- browse files
map {'n', '<Leader>bf', ':Telescope file_browser<CR>'}

-- grep within files
map {'n', '<Leader>gf', ':Telescope live_grep<CR>'}

-- find buffer
map {'n', '<Leader>fb', ':Telescope buffers<CR>'}

-- Bunch of bindings for Hop
map {'n', '<Leader><Leader>w', ':HopWord<CR>'}
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
