vim.pack.add({
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/qvalentin/helm-ls.nvim",                 ft = "helm" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/catppuccin/nvim",                        priority = 1000,          name = "catppuccin" },
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
	{ src = 'https://github.com/rmagatti/auto-session' },
	{ src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
	{ src = 'https://github.com/hrsh7th/nvim-cmp' },
	{ src = "https://github.com/gbprod/substitute.nvim" },
	{ src = 'https://github.com/numToStr/Comment.nvim' },
	{ src = 'https://github.com/folke/which-key.nvim' },
	{ src = 'https://github.com/windwp/nvim-autopairs' },
	{ src = 'https://github.com/kylechui/nvim-surround' },
})

vim.lsp.enable({
	'omnisharp',
	'gopls',
	'nixd',
	'lua_ls',
	'yamlls',
	'jsonls',
	'hls',
	'bashls',
	'dockerls',
	'ltex',
	'ts_ls',
	'helm_ls',
	'marksman',
	'tinymist',
	'nginx_language_server',
	'docker_compose_language_service',
})

vim.lsp.config("nixd", {
	cmd = { "nixd" },
	filetypes = { "nix" },
	root_markers = { "flake.nix", ".git" },
})

vim.lsp.config("jsonls", {
	cmd = { "vscode-json-languageserver", "--stdio" },
	filetypes = { "json", "jsonc" },
	root_markers = { ".git" },
	init_options = {
		provideFormatter = true
	}
})

vim.lsp.config("vtsls", {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	settings = {
		vtsls = { tsserver = { globalPlugins = {} } },
		typescript = {
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
		},
	},
	before_init = function(_, config)
		table.insert(config.settings.vtsls.tsserver.globalPlugins, {
			name = "@vue/typescript-plugin",
			location = "/run/current-system/sw/bin/vue-language-server",
			languages = { "vue" },
			configNamespace = "typescript",
			enableForWorkspaceTypeScriptVersions = true,
		})
	end,
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
})


vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.tabstop = 4
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"
vim.opt.wrap = true
vim.opt.shiftwidth = 4
vim.o.termguicolors = true


-- Configuration of plugins
require("catppuccin").setup({
	-- This line is correct, uncomment it if you want to set the global flavor
	flavour = "latte",
	background = { -- :h background
		light = "latte",
	},
})

require('lualine').setup {
	tabline = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diagnostics' },
		lualine_c = { },
		lualine_x = {  },
		lualine_y = { 'buffers' },
		lualine_z = {  }
	},
	sections = {},
	theme = 'catppuccin'
}

require("nvim-surround").setup({})
require("oil").setup()
require("auto-session").setup {
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
}
require 'nvim-treesitter'.setup()

-- require 'nvim-treesitter'.install { "helm", "css", "c", "lua", "vim", "vimdoc", "query", "python", "bash", "nix", "dockerfile", "csharp", "markdown", "json", "typescript" }

local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<C-e>'] = cmp.mapping.abort(),
		['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
		['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
		['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'insert' }),
		['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'insert' }),
		['<C-p>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = 'insert' })
			else
				cmp.complete()
			end
		end),
		['<C-n>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = 'insert' })
			else
				cmp.complete()
			end
		end),
	},
})

require("nvim-autopairs").setup()
require('substitute').setup()

require('telescope').setup({
	pickers = {
		live_grep = {
			file_ignore_patterns = { 'node_modules', '.git/', '.venv' },
			additional_args = function(_)
				return { "--hidden" }
			end
		},
		find_files = {
			file_ignore_patterns = { 'node_modules', '.git/', '.venv' },
			hidden = true
		}

	},
})
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>o', builtin.live_grep, { desc = 'Telescope live grep' })

-- Sub
vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
vim.keymap.set("n", "S", require('substitute').eol, { noremap = true })
vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })


-- LSP
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.api.nvim_set_keymap('n', '<leader>tf', ':!typstfmt %<CR>', { silent = true })
vim.keymap.set('n', 'go', vim.diagnostic.open_float)
vim.keymap.set('n', 'gd', "<C-]><CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gg', ":LazyGit<CR>", { noremap = true, silent = true })

-- Good navigation mappings for wrap
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

-- Buffer navigation
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Window navigation
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Space>c', ':bdelete<CR>', { silent = true })

-- Highlight yanked
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight_yank', {}),
	desc = 'Hightlight selection on yank',
	pattern = '*',
	callback = function()
		vim.highlight.on_yank { higroup = 'IncSearch', timeout = 50 }
	end,
})


-- Bindings for save and quit
vim.api.nvim_set_keymap('n', '<Space>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>q', ':qa<CR>', {})

vim.cmd('colorscheme catppuccin-latte')
