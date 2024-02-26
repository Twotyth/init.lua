return {
    'nvim-tree/nvim-web-devicons',
    {
        'levouh/tint.nvim',
        event = 'VeryLazy',
        ---@type TintUserConfiguration
        opts = {
            saturation = 0.5,
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
        "folke/flash.nvim",
        event = 'VeryLazy',
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
        ---@type Flash.Config
        opts = {
            labels = 'adweqrc',
            label = {
                reuse = 'all',
                rainbow = { enabled = true, shade = 5 }
            }
        }
    },
    {
        "j-hui/fidget.nvim",
        event = 'VeryLazy',
        opts = {
            notification = {
                override_vim_notify = true
            }
        }
    }
}
