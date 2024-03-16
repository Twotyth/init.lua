vim.mapleader = ' '
vim.maplocalleader = ' '

local ut = require('twoty.utils')

-- == for outer node lsp formatting
ut.map_noremap('n', '==', function()
    local node = vim.treesitter.get_node()
    if node == nil then
        return
    end

    local start_row
    local end_row
    local start_col
    local end_col
    while (node:parent() and start_row == end_row) do
        start_row, start_col, end_row, end_col = node:range()
        node = node:parent()
    end

    local node_range = {
        ['start'] = { start_row + 1, start_col },
        ['end'] = { end_row + 1, end_col },
    }
    vim.lsp.buf.format({ range = node_range })
    vim.diagnostic.show(nil, 0) -- formatting messess up virtual text

    -- prettier
    ut.flash_region_cur_buf(nil, node_range['start'][1] - 1, node_range['end'][1] - 1)
    vim.notify('Formatted ' .. end_row + 1 - start_row .. ' rows', 2)
end)

-- insert new line on enter in normal mode
ut.map('n', '<M-o>', 'o<esc>')


ut.map_noremap({ 'n', 'v' }, '<S-up>', '5<up>')
ut.map_noremap({ 'n', 'v' }, '<S-down>', '5<down>')

-- persistant undo
ut.map('n', 'U', '<C-r>')

-- move lines on alt + arrow
ut.map_silent('v', '<A-up>', ":m '<-2<CR>gv=gv")
ut.map_silent('v', '<A-down>', ":m '>+1<CR>gv=gv")
ut.map_silent('n', '<A-up>', ":m-2<CR>==")
ut.map_silent('n', '<A-down>', ":m+1<CR>==")

-- cursor next/prev
ut.map('n', '{', '<C-o>')
ut.map('n', '}', '<C-i>')

ut.map('n', '<A-v>', '<C-v>')

-- debinded
ut.map('n', 'Q', '<nop>')
ut.map('n', 'h', '<nop>')
ut.map('n', 'j', '<nop>')
ut.map('n', 'k', '<nop>')
ut.map('i', '<c-k>', '<nop>')
ut.map('n', 'l', '<nop>')

-- text manipulation

ut.map('n', 'rwp', 'viwpyiw')
ut.map('n', 'rWp', 'viWpyiW')
ut.map('n', 'rwP', 'viwPyiw')
ut.map('n', 'rWP', 'viWPvyiW')

-- make d just delete, leave x for cut
ut.map('n', 'd', '"_d')
