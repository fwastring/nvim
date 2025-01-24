-- Lualine
local lualine_hidden = true

function ToggleLualine()
  if lualine_hidden then
    require('lualine').hide({unhide=true})
  else
    require('lualine').hide()
  end
  lualine_hidden = not lualine_hidden
end

-- vim.api.nvim_set_keymap('n', '<Space>b', ":lua ToggleLualine()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>1', "1gt", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>2', "2gt", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>3', "3gt", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>4', "4gt", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>5', "5gt", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>6', "6gt", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>7', "7gt", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>8', "8gt", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'n', "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', "Nzzzv", { noremap = true, silent = true })

-- Leap
-- vim.keymap.set('n', 'z', '<Plug>(leap)')
-- vim.keymap.set('n', 'Z', '<Plug>(leap-from-window)')
-- vim.keymap.set({ 'x', 'o' }, 'z', '<Plug>(leap-forward)')
-- vim.keymap.set({ 'x', 'o' }, 'Z', '<Plug>(leap-backward)')

-- Substitute
vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
vim.keymap.set("n", "S", require('substitute').eol, { noremap = true })
vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })

-- Good navigation mappings for wrap
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

-- Buffer navigation
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Tab>', ':tabnext<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

-- Window navigation
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Space>c', ':Bdelete<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Space>t1', ':ScopeMoveBuf 1<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Space>t2', ':ScopeMoveBuf 2<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Space>t3', ':ScopeMoveBuf 3<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Space>t4', ':ScopeMoveBuf 4<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Space>t5', ':ScopeMoveBuf 5<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Space>t6', ':ScopeMoveBuf 6<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Space>t7', ':ScopeMoveBuf 7<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Space>t8', ':ScopeMoveBuf 8<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Space>t9', ':ScopeMoveBuf 9<CR>', { silent = true })
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

-- Vimtex
vim.api.nvim_set_keymap('n', '<Space>v', ':VimtexCompile<CR>', { silent = true })

-- Telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Space>f', builtin.find_files, {})
vim.keymap.set('n', '<Space>o', builtin.live_grep, {})
vim.keymap.set('n', '<Space>h', builtin.buffers, {})
vim.keymap.set('n', '<Space>gc', builtin.git_commits, {})
vim.keymap.set('n', '<Space>gs', builtin.git_status, {})
vim.keymap.set('n', '<Space>gf', builtin.git_files, {})
vim.keymap.set('n', '<Space>7', builtin.current_buffer_fuzzy_find, {})

-- Bindings for save and quit
vim.api.nvim_set_keymap('n', '<Space>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>q', ':ScopeSaveState<CR>::qa<CR>', {})

-- Ranger bindings
vim.api.nvim_set_keymap('n', '<Space>e', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true, silent = true })
vim.api.nvim_set_var('rnvimr_enable_ex', 1)
vim.api.nvim_set_var('rnvimr_hidden_filter', "")
vim.api.nvim_set_var('rnvimr_enable_picker', 1)
vim.api.nvim_set_var('rnvimr_edit_cmd', 'drop')
vim.api.nvim_set_var('rnvimr_draw_border', 0)
vim.api.nvim_set_var('rnvimr_hide_gitignore', 0)
vim.api.nvim_set_var('rnvimr_border_attr', {fg = 14, bg = -1})
vim.api.nvim_set_var('rnvimr_enable_bw', 1)
vim.api.nvim_set_var('rnvimr_shadow_winblend', 70)
vim.api.nvim_set_var('rnvimr_ranger_cmd', {'ranger', '--cmd=set draw_borders both'})
