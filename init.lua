vim.pack.add({
	{ src = 'https://github.com/akinsho/bufferline.nvim',                version = "v4.9.1" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter",        version = 'main' },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/qvalentin/helm-ls.nvim",                 ft = "helm" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = 'https://github.com/rmagatti/auto-session' },
	{ src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
	{ src = 'https://github.com/hrsh7th/nvim-cmp' },
	{ src = "https://github.com/gbprod/substitute.nvim" },
	{ src = 'https://github.com/numToStr/Comment.nvim' },
	{ src = 'https://github.com/folke/which-key.nvim' },
	{
		src = 'https://github.com/windwp/nvim-autopairs',
	},
})

vim.lsp.enable({
	'vtsls',
	'omnisharp',
	'gopls',
	'nixd',
	'lua_ls',
	'yamlls',
	'jsonls',
	'tailwindcss',
	'clangd',
	'hls',
	'jsonls',
	'rust_analyzer',
	'bashls',
	'dockerls',
	'docker_compose_language_service',
	'ltex',
	'ts_ls',
	'marksman',
	'helm_ls',
	'marksman',
	'tinymist',
	'nginx_language_server',
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
vim.o.cmdheight = 0


-- Configuration of plugins
require("catppuccin").setup({
	default_integrations = false,
})
local bufferline = require("bufferline")
local mocha = require("catppuccin.palettes").get_palette "latte"
-- bufferline.setup {
-- 	highlights = require("catppuccin.groups.integrations.bufferline").get {
-- 		styles = { "italic", "bold" },
-- 		custom = {
-- 			all = {
-- 				fill = { bg = "#000000" },
-- 			},
-- 			mocha = {
-- 				background = { fg = mocha.text },
-- 			},
-- 			latte = {
-- 				background = { fg = "#000000" },
-- 			},
-- 		},
-- 	},
-- }
require("auto-session").setup {
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
}
require 'nvim-treesitter'.setup()

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--
-- parser_config.csharp = {
-- 	install_info = {
-- 		url = "https://github.com/tree-sitter/tree-sitter-c-sharp", -- local path or git repo
-- 		files = { "src/parser.c" },                           -- note that some parsers also require src/scanner.c or src/scanner.cc
-- 		branch = "master",                                    -- default branch in case of git repo if different from master
-- 		generate_requires_npm = false,                        -- if stand-alone parser without npm dependencies
-- 		requires_generate_from_grammar = false,               -- if folder contains pre-generated src/parser.c
-- 	},
-- 	filetype = "cs",                                          -- if filetype does not match the parser name
-- }

-- require 'nvim-treesitter.configs'.setup {
-- 	ensure_installed = { "helm", "css", "c", "lua", "vim", "vimdoc", "query", "python", "bash", "nix", "dockerfile", "csharp", "markdown", "json", "typescript" },
-- 	sync_install = false,
-- 	auto_install = true,
-- 	ignore_install = { "vue" },
--
-- 	highlight = {
-- 		enable = true,
--
-- 		disable = function(lang, buf)
-- 			local max_filesize = 100 * 1024 -- 100 KB
-- 			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
-- 			if ok and stats and stats.size > max_filesize then
-- 				return true
-- 			end
-- 		end,
-- 		additional_vim_regex_highlighting = false,
-- 	},
-- }
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

-- If you want insert `(` after select function or method item

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
vim.keymap.set('n', 'go', vim.diagnostic.open_float)
vim.keymap.set('n', 'gd', "<C-]><CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gg', ":LazyGit<CR>", { noremap = true, silent = true })

-- Good navigation mappings for wrap
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

-- Buffer navigation
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Tab>', ':tabnext<CR>', { noremap = true, silent = true })

-- Window navigation
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Space>c', ':bdelete<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Space>tn', ':tabnew<CR>', { silent = true })

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
