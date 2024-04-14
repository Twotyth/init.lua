return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        opts = {
            on_attach = function (bufnr)
                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end
                local gs = package.loaded.gitsigns
                -- git preview
                map('n', 'gp', gs.preview_hunk_inline)
                -- map('n', 'gd', gs.diffthis)
                -- map('n', 'gu', gs.reset_hunk)
            end
        },
    },
    {
        'NeogitOrg/neogit',
        keys = '<leader>g',
        config = function ()
            local neogit = require('neogit')
            neogit.setup({
                graph_style = "unicode",
                disable_context_highlighting = true,
                status = { recent_commit_count = 10 },
                signs = {
                    section = { '', '' },
                    item = { ' ', '' }
                }
            })
            vim.keymap.set('n', '<leader>g', function ()
                neogit.open( { kind = 'split' } )
                vim.wo.wrap = true
            end)
        end
    },
}
