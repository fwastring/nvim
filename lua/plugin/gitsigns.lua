require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<Space>hs', gitsigns.stage_hunk)
    map('n', '<Space>hr', gitsigns.reset_hunk)
    map('v', '<Space>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<Space>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<Space>hS', gitsigns.stage_buffer)
    map('n', '<Space>hu', gitsigns.undo_stage_hunk)
    map('n', '<Space>hR', gitsigns.reset_buffer)
    map('n', '<Space>hp', gitsigns.preview_hunk)
    map('n', '<Space>hb', function() gitsigns.blame_line{full=true} end)
    map('n', '<Space>tb', gitsigns.toggle_current_line_blame)
    map('n', '<Space>hd', gitsigns.diffthis)
    map('n', '<Space>hD', function() gitsigns.diffthis('~') end)
    map('n', '<Space>td', gitsigns.toggle_deleted)

    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
