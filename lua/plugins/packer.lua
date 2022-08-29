local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function()
	-- Packer just manages itself
	use 'wbthomason/packer.nvim'

	-- nvim LSP configs
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'williamboman/nvim-lsp-installer'

	----------------
	-- Plugin development
	----------------
	-- Work in progress. Using upstream by default:
	use 'jpmcb/nvim-go'
	-- If working locally, comment out above 
	-- and uncomment below. Replace path with appropriate working local config
	--use '~/workspace/nvim-go'

	-- Luasnip
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	-- Theme should be dark. Always.
	use 'navarasu/onedark.nvim'

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
	}

	-- nvim file tree. Alternative to NerdTree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		config = function() require'nvim-tree'.setup {} end
	}

	use 'airblade/vim-gitgutter'

	use 'preservim/nerdcommenter'

	-- more plugins for git and brackets
	use 'tpope/vim-surround'
	use 'tpope/vim-fugitive'

	-- Yanking manager
	use {
		"AckslD/nvim-neoclip.lua",
		requires = { {'nvim-telescope/telescope.nvim'} },
		config = function()
			require('neoclip').setup()
		end,
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.theta'.config)
		end
	}

	use 'simrat39/rust-tools.nvim'
	use 'mfussenegger/nvim-dap'
	

	use {'mg979/vim-visual-multi'}

	-- Typescript. Oh Typescript. Where art thou Typescript.
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'
	
	-- trouble for showing diagnostics at one place
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
			  -- your configuration comes here
			  -- or leave it empty to use the default settings
			  -- refer to the configuration section below
			}
		end
	}

	-- golang language server
	use 'ray-x/go.nvim'

	-- tab bar plugin
	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
