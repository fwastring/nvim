vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter",        version = 'main' },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/qvalentin/helm-ls.nvim", ft = "helm" },
	{
		src = "https://github.com/catppuccin/nvim",
	},
	{
		src = 'https://github.com/windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},
	{
		src = 'https://github.com/rmagatti/auto-session',
	},
	{
		src = 'https://github.com/hrsh7th/cmp-nvim-lsp'
	},
	{
		src = 'https://github.com/hrsh7th/nvim-cmp'
	},
	{
		src = "https://github.com/gbprod/substitute.nvim",
		opts = {}
	},
	{
		src = 'https://github.com/numToStr/Comment.nvim',
		opts = {},
		lazy = false,
	},
})

vim.lsp.enable({
	'vue_ls',
	'omnisharp',
	'gopls',
	'nixd',
	'lua_ls',
	'yamlls',
	'jsonls',
	'tailwindcss',
	'clangd',
	'hls',
	'rust_analyzer',
	'bashls',
	'dockerls',
	'docker_compose_language_service',
	'ltex',
	'ts_ls',
	'marksman',
	'helm_ls',
})

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
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
require("auto-session").setup {
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
}
require 'nvim-treesitter'.setup()

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.csharp = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-c-sharp", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    branch = "master", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "cs", -- if filetype does not match the parser name
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "css", "c", "lua", "vim", "vimdoc", "query", "python", "bash",  "nix", "dockerfile", "csharp", "markdown", "json", "typescript" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "vue" },

  highlight = {
    enable = true,

    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}
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
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

require "mini.pick".setup()


-- LSP
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', 'go', vim.diagnostic.open_float)
vim.keymap.set('n', 'gd', "<C-]><CR>", { noremap = true, silent = true })

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

-- Pick
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>o', ":Pick grep_live<CR>")


-- Bindings for save and quit
vim.api.nvim_set_keymap('n', '<Space>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>q', ':qa<CR>', {})

vim.cmd('colorscheme catppuccin-latte')
