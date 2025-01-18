return {
    {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup()
        end
    },
    {
        'levouh/tint.nvim',
        lazy = true,
        config = function ()
            require('tint').setup({
                tint = -7,
                tint_background_colors = true,
                window_ignore_function = function(winid)
                    return vim.api.nvim_win_get_config(winid).relative ~= ""
                end
            })
        end
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
    {
        'nvimdev/indentmini.nvim',
        event = 'BufReadPre',
        config = function()
            require 'indentmini'.setup({
                char = '▎'
            })
        end
    },
    {
        'RRethy/vim-illuminate',
        event = 'BufReadPost',
        dependencies = {
            'yazeed1s/oh-lucy.nvim'
        },
        config = function()
            require('illuminate').configure({
                providers = { 'treesitter', 'lsp' },
                delay = 50,
            })

            vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'LspReferenceText' })
            vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'LspReferenceRead' })
            vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'LspReferenceWrite' })
        end
    },
    {
        'petertriho/nvim-scrollbar',
        event = 'BufReadPre',
        config = function() require('scrollbar').setup() end
    },
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
            cursor_color = '#52ad70',
        }
    }
}
