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

vim.o.termguicolors = true
vim.cmd('colorscheme catppuccin-mocha')
