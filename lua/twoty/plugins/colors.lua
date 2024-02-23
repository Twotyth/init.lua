return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        --priority = 1000,
        config = function() vim.cmd('colorscheme rose-pine') end
    },
    {
        'yazeed1s/oh-lucy.nvim',
        lazy = true,
        config = function ()
            vim.cmd('colorscheme oh-lucy-evening')
        end
    },
    {
        'mellow-theme/mellow.nvim',
        lazy = true,
        --config = function ()  end
    },
    {
        'rktjmp/lush.nvim',
        lazy = true,
    },
}
