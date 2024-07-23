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

-- vim.api.nvim_command('autocmd VimEnter * lua require("lualine").hide()')

require("lazy").setup("plugins")

-- Keybindsings
require 'keybindings.keymap'

-- Configuration of plugins
require 'plugin.telescope'
require 'plugin.yanky'
require 'plugin.fzf_lsp'
require 'plugin.lsp_config'
require 'plugin.treesitter'
require 'plugin.dracula'
require 'plugin.cmp'
require 'plugin.auto_session'
require 'plugin.gitsigns'
require 'plugin.lualine'

vim.o.termguicolors = true
-- vim.cmd('colorscheme catppuccin-mocha')
vim.cmd('colorscheme base16-catppuccin-mocha')
