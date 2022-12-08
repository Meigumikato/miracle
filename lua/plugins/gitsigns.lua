local M = {}

M.options = {
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr=true, desc = 'git next hunk' })
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr=true, desc = 'git prev hunk' })

    -- Actions
    map('n', '<space>hs', ':Gitsigns stage_hunk<CR>', { desc = 'n git stage hunk' })
    map('v', '<space>hs', ':Gitsigns stage_hunk<CR>', { desc = 'v git stage hunk' })
    map('n', '<space>hr', ':Gitsigns reset_hunk<CR>', { desc = 'n git reset hunk' })
    map('v', '<space>hr', ':Gitsigns reset_hunk<CR>', { desc = 'v git reset hunk' })
    map('n', '<space>hS', '<cmd>Gitsigns stage_buffer<CR>', { desc = 'git stage buffer' })
    map('n', '<space>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', { desc = 'git undo stage hunk' })
    map('n', '<space>hR', '<cmd>Gitsigns reset_buffer<CR>', { desc = 'git reset buffer' })
    map('n', '<space>hp', '<cmd>Gitsigns preview_hunk<CR>', { desc = 'git preview hunk' })
    map('n', '<space>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { desc = 'git blame lines' })
    map('n', '<space>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = 'git blame current line' })
    map('n', '<space>hd', '<cmd>Gitsigns diffthis<CR>', { desc = 'git diff this' })
    map('n', '<space>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>', { desc = 'git diff this' })
    map('n', '<space>td', '<cmd>Gitsigns toggle_deleted<CR>', { desc = 'git toggle delete' })

    -- Text object
    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

function M.setup()
  require('gitsigns').setup(M.options)
end

return M
