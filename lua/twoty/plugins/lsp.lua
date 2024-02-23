local lsp = {
    'neovim/nvim-lspconfig',
    event = "BufReadPre",
    cmd = {'Mason', 'LspInfo', 'LspRestart', 'LspStart'},
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        "j-hui/fidget.nvim",
        { 'folke/neodev.nvim', opts = {} },
        'jmederosalvarado/roslyn.nvim',
    },
    config = function()
        require('fidget').setup({})
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls', 'clangd' },
            handlers = {
                function(server_name)
                   require('lspconfig')[server_name].setup({})
                end,
            }
        })

        require('roslyn').setup({
            capabilities = vim.lsp.protocol.make_client_capabilities()
        })
    end,
}

local compy = {
    'hrsh7th/cmp-nvim-lsp',
    event = "InsertEnter",
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    },
    config = function ()
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                 completion = cmp.config.window.bordered()
            --     documentation = ...
             },
            mapping = cmp.mapping.preset.insert({
                ['['] = cmp.mapping.select_prev_item(cmp_select),
                [']'] = cmp.mapping.select_next_item(cmp_select),
                ['<Tab>'] = cmp.mapping.confirm(cmp_select),
                ['<cr>'] = cmp.mapping.confirm(cmp_select),
            }),
            sources = cmp.config.sources(
                {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
                {
                    { name = 'buffer' },
                }
            )
        })
    end
}


local trouble = {
    'folke/trouble.nvim',
    keys = {
        '<leader>u',
        '<leader>p',
        '<leader>P',
    },
    opts = { },
    config = function ()
        local opts = { noremap = true }
        vim.keymap.set('n', '<leader>u', function() require('trouble').toggle('lsp_references') end, opts)
        vim.keymap.set('n', '<leader>p', function() require('trouble').toggle('document_diagnostics') end, opts)
        vim.keymap.set('n', '<leader>P', function() require('trouble').toggle('workspace_diagnostics') end, opts)
    end

}

return { lsp, compy, trouble }
