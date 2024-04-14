local treesitter = {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    build = ':TSUpdate',
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

        vim.opt.foldmethod = 'expr'
        -- vim.opt.foldexpr =
        require('twoty.utils').map_noremap('n', '<leader>i', vim.inspect_pos)
    end
}

return { treesitter }
