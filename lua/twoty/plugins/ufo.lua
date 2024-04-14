return {
    'kevinhwang91/nvim-ufo',
    lazy = true,
    dependencies = {
        'kevinhwang91/promise-async'
    },
    config = function ()
        vim.o.foldlevel = 1000
        vim.o.foldlevelstart = 1000
        vim.o.foldenable = true

        require('ufo').setup({
            open_fold_hl_timeout = 0
        })

    end
}
