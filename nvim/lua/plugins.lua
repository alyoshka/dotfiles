vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'mhinz/vim-startify'
	use 'romgrk/barbar.nvim'

	use {
		'nvim-lualine/lualine.nvim',
		requires = {'nvim-tree/nvim-web-devicons', opt = true},
		config = function()
			require('lualine').setup()
		end,
	}
	
	use {
		'nvim-tree/nvim-tree.lua',
		requires = 'nvim-tree/nvim-web-devicons',
		config = function()
			require'nvim-tree'.setup {}
		end,
	}

	use {
		'navarasu/onedark.nvim',
		config = function()
			require('onedark').load()
		end,
	}
	
	use {
		'Wansmer/langmapper.nvim',
		config = function()
			require('langmapper').setup({})
		end,
	}
end)
