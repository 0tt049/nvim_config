-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
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

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		-- or,
		-- branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

  use 'mfussenegger/nvim-dap'

  use 'jpalardy/vim-slime'

  use {
  'mrcjkb/haskell-tools.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim', -- optional
  },
  branch = '1.x.x', -- recommended
}

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

	-- Color Theme
	use({ 'ellisonleao/gruvbox.nvim', as = 'gruvbox' })
	vim.cmd('colorscheme gruvbox')

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use( 'nvim-treesitter/playground' )

	-- SuperCollider
	use {
		'davidgranstrom/scnvim',
		config = function()
			require('scnvim').setup()
		end
	}

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {}
    end
  }

end)
