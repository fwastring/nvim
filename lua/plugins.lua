return {
	{
		"gbprod/yanky.nvim",
	},
	{
		'lewis6991/gitsigns.nvim'
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
	{
		'rmagatti/auto-session',
	},
	{
		"camspiers/snap",
	},
	{
		"Mofiqul/dracula.nvim"
	},
	{
		"BurntSushi/ripgrep",
	},
	{
		'kevinhwang91/rnvimr',
	},
	{
		'ggandor/leap.nvim',
	},
	{
		'gfanto/fzf-lsp.nvim',
	},
	{
		"folke/which-key.nvim",
	},
	{
		"folke/neodev.nvim",
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		'neovim/nvim-lspconfig'
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
}
