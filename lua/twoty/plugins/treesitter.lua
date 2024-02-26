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
        })
    end
}

return { treesitter }
