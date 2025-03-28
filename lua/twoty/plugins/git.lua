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
                map('n', '<M-d>', gs.preview_hunk_inline)
                -- map('n', 'gd', gs.diffthis)
                map('n', '<M-z>', gs.reset_hunk)

                -- Navigation
                map({'n', 'i'}, '<c-down>', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']c', bang = true })
                    else
                        gs.nav_hunk('next')
                    end
                end)
                map({'n', 'i'}, '<c-up>', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ '[c', bang = true })
                    else
                        gs.nav_hunk('prev')
                    end
                end)
            end
        },
    },
    {
        'SuperBo/fugit2.nvim',
        keys = { { '<leader>g', '<cmd>Fugit2<cr>' } },
        dependencies = {
            'MunifTanjim/nui.nvim',
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim',
            'chrisgrieser/nvim-tinygit',     -- optional: for Github PR view
        },
        cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph' },
        opts = { min_width = 70 }
    },
}
