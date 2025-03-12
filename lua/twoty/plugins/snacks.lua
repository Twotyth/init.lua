return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        indent = {
            enabled = true,
            indent = { char = '▏' },
            scope = { char = '▏' },
            animate = { enabled = false },
        },
        input = { enabled = true, },
        quickfile = { enabled = true },
        picker = { enabled = true },
        -- scope = { enabled = true },
        statuscolumn = {
            enabled = true,
            left = { "fold", "git" }, -- priority of signs on the right (high to low)
            right = { "mark", "sign" }, -- priority of signs on the left (high to low)
        },
        styles = {
            input = {
                relative = 'cursor',
                row = -3,
                col = 0,
                keys = {
                    i_esc = { '<esc>', { 'cmp_close', 'cancel' }, mode = 'i', expr = true },
                }
            },
            picker = {
                keys = {
                    i_esc = { '<esc>', { 'cmp_close', 'cancel' }, mode = 'i', expr = true },
                }
            }
        }
    },
}
