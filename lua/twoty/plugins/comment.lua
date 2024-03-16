return {
    'numToStr/Comment.nvim',
    keys = { '<leader>c' },
    config = function ()
        require('Comment').setup({
            toggler = {
                line = '<leader>c',
                block = '<nop>',
            },
            mappings = {
                basic = true,
                extra = false
            }
        })
        local ut = require('twoty.utils')
        local esc = vim.api.nvim_replace_termcodes('<esc>', true, false, true)
        ut.map_noremap('v', '<leader>c', function ()
            vim.api.nvim_feedkeys(esc, 'nx', false)
            require('Comment.api').toggle.linewise(vim.fn.visualmode())
        end)
    end
}
