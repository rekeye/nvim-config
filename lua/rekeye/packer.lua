-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
	use {'nvim-telescope/telescope-ui-select.nvim' }

  use({
	  'stevedylandev/flexoki-nvim',
	  as = 'flexoki',
	  config = function()
		  vim.cmd('colorscheme flexoki')
	  end
  })

  use { 
	  'nvim-treesitter/nvim-treesitter', 
	  run = ':TSUpdate'
  }
  use('nvim-treesitter/playground')
	use('nvim-treesitter/nvim-treesitter-context')

  use('mbbill/undotree')
  use('tpope/vim-fugitive')

	use {
		'neoclide/coc.nvim',
		branch = 'release'
	}
	use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
		}
	})

	use {
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {}
	}

	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
		tag = 'nightly'
	}

	use {
    "AmeerTaweel/todo.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        require("todo").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end
	}

	use {'akinsho/git-conflict.nvim', tag = "*", config = function()
		require('git-conflict').setup()
	end}

	use {
		"ThePrimeagen/harpoon", 
		requires = "nvim-lua/plenary.nvim",
	}

	-- Flutter
	use {
		'akinsho/flutter-tools.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
	}
end)
