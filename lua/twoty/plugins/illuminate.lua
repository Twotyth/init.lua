local function setup_higroups()
end

local denylist = {
    'mason',
    'netrw',
    'NeogitStatus',
}

return {
    'RRethy/vim-illuminate',
    event = 'BufReadPre',
    config = function ()
        require('illuminate').configure({
            filetypes_denylist = denylist,
            modes_denylist = { 'v', 'V' },
            delay = 50,
        })
        setup_higroups()
    end,
    setup_higroups = function ()
        vim.api.nvim_set_hl(0, "Visual", { bg = '#343439', blend = 20 })
        vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
    end
}
