local execute = vim.api.nvim_command
local fn = vim.fn

local packer_install_dir = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

local packer_repo = 'https://github.com/wbthomason/packer.nvim'
local install_cmd = string.format('10split |term git clone --depth=1 %s %s', packer_repo, packer_install_dir)

if fn.empty(fn.glob(packer_install_dir)) > 0 then
  vim.api.nvim_echo({{'Installing packer.nvim', 'Type'}}, true, {})
  execute(install_cmd)
  execute 'packadd packer.nvim'
end


-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local packer = require'packer'
local util = require'packer.util'

packer.init({
	package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
packer.startup(function()
	local use = use

	-- super cool grammar based highlighting
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function() require('plugins.treesitter') end
	}

	use 'eddyekofo94/gruvbox-flat.nvim'

	-- LSP stuff here
	use 'folke/lsp-colors.nvim'
	use 'neovim/nvim-lspconfig'
	use { 'tami5/lspsaga.nvim' }
	use {
		'ms-jpq/coq_nvim',
		config = function() require('plugins.autocomplete') end
	}
	use 'ms-jpq/coq.artifacts'

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'folke/which-key.nvim',
		config = function() require("which-key").setup {} end
	}

	use {
		'phaazon/hop.nvim',
		branch = 'v1',
		config = function() require("hop").setup() end
	}

	use 'lukas-reineke/indent-blankline.nvim'

	use {
		'akinsho/bufferline.nvim',
		config = function() require("bufferline").setup{
			options = {
				diagnostics = 'nvim_lsp',
			}
		} end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
	}

	end
)
