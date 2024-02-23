return {
    { 'nvim-tree/nvim-web-devicons' },
    {
        'levouh/tint.nvim',
        config = function()
            require('tint').setup{
                tint = -7,
                tint_background_colors = true
            }
        end
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
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    }
}
