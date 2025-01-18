local treesitter = {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    build = ':TSUpdate',
    lazy = vim.fn.argc(-1) == 0,
    init = function(plugin)
        require('lazy.core.loader').add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "cpp", "lua", "html", "c_sharp" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<tab>',
                    node_incremental = '<tab>',
                    node_decremental = '<s-tab>',
                }
            }
        })


        require('twoty.utils').noremap('n', '<leader>i', vim.inspect_pos)
    end
}

return { treesitter }
