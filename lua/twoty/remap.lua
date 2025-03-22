---@diagnostic disable: need-check-nil
vim.mapleader = ' '
vim.maplocalleader = ' '

local ut = require('twoty.utils')

-- == for outer node lsp formatting
ut.noremap('n', '==', function()
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
    -- check if clients of current buffer that support formatting exist
    if #vim.lsp.get_clients({ bufnr = 0, method = 'textDocument/formating' }) ~= 0 then
        vim.lsp.buf.format({ range = node_range })
        vim.diagnostic.show(nil, 0) -- formatting messess up virtual text
        ut.flash_region_cur_buf(nil, node_range['start'][1] - 1, node_range['end'][1] - 1)
    else
        require('nvim-treesitter.incremental_selection').node_incremental(node:parent())
        ut.feedkeys('=')
    end

    -- prettier
    vim.notify('Formatted ' .. end_row + 1 - start_row .. ' rows', 2)
end)

ut.noremap({ 'n', 'v' }, '<S-up>', '5<up>')
ut.noremap({ 'n', 'v' }, '<S-down>', '5<down>')

-- persistant undo
ut.map('n', 'U', '<C-r>')

-- move lines on alt + arrow
ut.map_silent('v', '<A-up>', ":m '<-2<CR>gv=gv")
ut.map_silent('v', '<A-down>', ":m '>+1<CR>gv=gv")
ut.map_silent('n', '<A-up>', ":m-2<CR>==")
ut.map_silent('n', '<A-down>', ":m+1<CR>==")

ut.noremap('n', '<leader>f', 'za')

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

-- save cursor placement
ut.noremap('n', '<M-/>', function ()
    local pos = vim.api.nvim_win_get_cursor(0)
    ut.feedkeys('gcc')
    vim.schedule(function ()
        vim.api.nvim_win_set_cursor(0, pos)
    end)
end)
ut.noremap('v', '<M-/>', function () ut.feedkeys('gc') end)
ut.noremap('i', '<M-/>', function ()
    local pos = vim.api.nvim_win_get_cursor(0)
    ut.feedkeys('<esc>gcci')
    vim.schedule(function ()
        vim.api.nvim_win_set_cursor(0, pos)
    end)
end)

-- make x just delete
ut.map('n', 'x', '"_x')

-- tabs
ut.map('n', '<M-e>', function ()
    vim.cmd.tabe()
    Snacks.explorer.open()
end)

ut.map_silent('n', 'q', function ()
    local res, _, _ = pcall(vim.api.nvim_win_close, 0, false)
    if res then return end
    vim.cmd.enew()
    Snacks.explorer.open()
end)
ut.map('n', '<M-right>', vim.cmd.tabnext)
ut.map('n', '<M-left>', vim.cmd.tabp)
ut.noremap('i', '<M-c><M-c>', function() ut.feedkeys('<esc>cc') end)
