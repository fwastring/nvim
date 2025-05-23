return {
	{
		'MunifTanjim/prettier.nvim'
	},
	{
		'mhartington/formatter.nvim'
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		'famiu/bufdelete.nvim'
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
			})
		end
	},
	{
	  "lervag/vimtex",
	  lazy = false,
	  init = function()
		vim.g.vimtex_view_method = "zathura"
	  end
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		"tiagovla/scope.nvim", config = true
	},
	{
		'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},
	{
		'rmagatti/auto-session',
	},
	{
		"camspiers/snap",
	},
	{
		"BurntSushi/ripgrep",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	{
		'gfanto/fzf-lsp.nvim',
	},
	{
		'hrsh7th/cmp-nvim-lsp'
	},
	{
		'hrsh7th/nvim-cmp'
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {}
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x'
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	},
	{
		"junegunn/fzf"
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"molleweide/LuaSnip-snippets.nvim",
			"saadparwaiz1/cmp_luasnip"
		},
		build = "make install_jsregexp"
	},
	{
		"gbprod/substitute.nvim",
		opts = {}
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		dependencies = {
			'nvim-lua/plenary.nvim'
		}
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<Space>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
		}
	},
	{
		'numToStr/Comment.nvim',
		opts = {},
		lazy = false,
	},
	{
		"seblj/roslyn.nvim",
		ft = "cs",
		opts = {
			-- your configuration comes here; leave empty for default settings
			exe = 'Microsoft.CodeAnalysis.LanguageServer'
		}
	},
	{
		'https://gitlab.com/itaranto/plantuml.nvim',
		version = '*',
		config = function() require('plantuml').setup(
			{
		  renderer = {
			type = 'image',
			options = {
			  prog = 'feh',
			  dark_mode = false,
			  format = nil, -- Allowed values: nil, 'png', 'svg'.
			}
		  },
		  render_on_write = true,
		}
		) end,
	}
}
