-- Settings
require 'opt.options'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Keybindsings
require 'keybindings.keymap'

-- Configuration of plugins
require 'plugin.telescope'
require 'plugin.fzf_lsp'
require 'plugin.lsp_config'
require 'plugin.treesitter'
require 'plugin.cmp'
require 'plugin.auto_session'
require("scope").setup({})
require 'plugin.lualine'
require 'plugin.formatter'
local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
    "vue",
  },
})

vim.lsp.enable('volar')

vim.lsp.config('volar', {
  -- add filetypes for typescript, javascript and vue
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    vue = {
      -- disable hybrid mode
      hybridMode = false,
    },
	  typescript = {
		tsdk = "/home/fw/dev/ifacts-ops/frontend/node_modules/typescript/lib"
	  }
  },
  root_markers = { "package.json" }
})

vim.lsp.config['ts_ls'] = {}


vim.lsp.enable('omnisharp')
vim.lsp.config('omnisharp', {
	cmd = { "OmniSharp", "-z", "--hostPID", "12345", "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" }
})

vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<cr>")

vim.o.termguicolors = true
vim.cmd('colorscheme catppuccin-latte')
