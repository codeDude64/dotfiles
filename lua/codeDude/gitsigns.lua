local gitsigns = require 'gitsigns'
local utils = require 'codeDude.utils'

gitsigns.setup {
  on_attach = function()
    local gs = package.loaded.gitsigns

    utils.key_mapper('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    utils.key_mapper('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    -- Actions
    utils.key_mapper({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    utils.key_mapper({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    utils.key_mapper('n', '<leader>hS', gs.stage_buffer)
    utils.key_mapper('n', '<leader>hu', gs.undo_stage_hunk)
    utils.key_mapper('n', '<leader>hR', gs.reset_buffer)
    utils.key_mapper('n', '<leader>hp', gs.preview_hunk)
    utils.key_mapper('n', '<leader>hb', function() gs.blame_line { full = true } end)
    utils.key_mapper('n', '<leader>tb', gs.toggle_current_line_blame)
    utils.key_mapper('n', '<leader>hd', gs.diffthis)
    utils.key_mapper('n', '<leader>hD', function() gs.diffthis('~') end)
    utils.key_mapper('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    utils.key_mapper({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
