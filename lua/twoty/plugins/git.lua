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
                map('n', 'gd', gs.diffthis)
            end
        },
    },
    {
        'NeogitOrg/neogit',
        event = 'VeryLazy',
        config = function ()
            local neogit = require('neogit')
            neogit.setup({
                graph_style = "unicode",
                status = { recent_commit_count = 10 }
            })
            vim.keymap.set('n', 'git', function ()
                neogit.open( { kind = 'vsplit' } )
                vim.wo.wrap = true
            end)
        end
    },

    setup_higroups = function ()
        vim.api.nvim_set_hl(0, 'DiffAdd', { fg='none', bg='#1e2e23' })
        vim.api.nvim_set_hl(0, 'DiffDelete', { fg='none', bg='#2a1d23' })
        vim.api.nvim_set_hl(0, 'DiffChange', { fg='none', bg='#1e1d30' })
    end
}
