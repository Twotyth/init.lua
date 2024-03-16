return {
    {
        'nvim-tree/nvim-web-devicons',
        config = function ()
            require('nvim-web-devicons').setup()
        end
    },
    {
        'levouh/tint.nvim',
        lazy = true,
        ---@type TintUserConfiguration
        opts = {
            tint = -7,
            tint_background_colors = true,
        }
    },
    {
        'theprimeagen/harpoon',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        keys = { '<leader>a', '<leader>e' },
        config = function()
            require('harpoon').setup({})
            vim.keymap.set('n', '<leader>a', require("harpoon.mark").add_file)
            vim.keymap.set('n', '<leader>e', require("harpoon.ui").toggle_quick_menu)
        end,
    },
    {
        "j-hui/fidget.nvim",
        event = 'VeryLazy',
        opts = {
            notification = {
                override_vim_notify = true
            }
        }
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        event = 'BufReadPre',
        ---@type ibl.config
        opts = {
            ---@type ibl.config.indent
            indent = {
                highlight = 'IndentBlanklineChar'
            },
            ---@type ibl.config.scope
            scope = {
                enabled = true,
                show_end = false,
                show_start = false,
                highlight = 'IblIndent'
            },
        }
    },
    {
        'RRethy/vim-illuminate',
        event = 'BufReadPre',
        lazy = false,
        config = function ()
            require('illuminate').configure({
                providers = { 'treesitter', 'lsp' },
                delay = 50,
            })

            vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'LspReferenceText' })
            vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'LspReferenceRead' })
            vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'LspReferenceWrite' })
        end
    }
}
