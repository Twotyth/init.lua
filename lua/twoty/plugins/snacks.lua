return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@module "snacks"
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
        explorer = { enabled = true, replace_netrw = true },
        picker = {
            enabled = true,
            win = {
                input = {
                    keys = {
                        ['esc'] = { 'close', mode = { 'n', 'i' } },
                    }
                },
            },
        },
        statuscolumn = {
            enabled = true,
            left = { "fold", "git" },
            right = { "mark", "sign" },
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
        },
    },
    ---@module "lazy"
    ---@type LazyKeysSpec[]
    keys = {
        {
            '<M-1>',
            function()
                local active = (Snacks.picker.get({ source = 'explorer' }) or {})[1]
                if not active then
                    Snacks.explorer.open()
                elseif active:current_win() then
                    active:close()
                else
                    active:focus()
                end
            end,
            { 'n', 'i' }
        }
    }
}
