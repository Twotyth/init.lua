return {
    { 'nvim-tree/nvim-web-devicons', opts = {} },
    {
        'levouh/tint.nvim',
        lazy = true,
        opts = {
            tint = -7,
            tint_background_colors = true,
            window_ignore_function = function(winid)
                return vim.api.nvim_win_get_config(winid).relative ~= ""
            end
        }
    },
    {
        "j-hui/fidget.nvim",
        event = 'UIEnter',
        opts = {
            notification = {
                override_vim_notify = true
            }
        }
    },
    -- {
    --     'RRethy/vim-illuminate',
    --     event = 'BufReadPost',
    --     dependencies = {
    --         'yazeed1s/oh-lucy.nvim'
    --     },
    --     config = function()
    --         require('illuminate').configure({
    --             providers = { 'lsp' },
    --             delay = 50,
    --         })
    --
    --         vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'LspReferenceText' })
    --         vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'LspReferenceRead' })
    --         vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'LspReferenceWrite' })
    --     end
    -- },
    -- {
    --     'petertriho/nvim-scrollbar',
    --     event = 'BufReadPre',
    --     config = function() require('scrollbar').setup() end
    -- },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } }
            },
        },
    },
    -- { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    {
        'sphamba/smear-cursor.nvim',
        event = 'VeryLazy',
        opts = {
            smear_insert_mode = false,
            cursor_color = '#52ad70',
        }
    }
}
