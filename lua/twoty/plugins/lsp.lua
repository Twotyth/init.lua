local lsp = {
    'neovim/nvim-lspconfig',
    event = "BufReadPre",
    cmd = {'Mason', 'LspInfo', 'LspRestart', 'LspStart'},
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'Decodetalkers/csharpls-extended-lsp.nvim',
        'Saghen/blink.cmp',
    },
    config = function()
        local function capabilities(opts)
            return require 'blink.cmp'.get_lsp_capabilities(opts or {})
        end
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls', 'clangd', 'omnisharp', 'gopls' },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup(capabilities())
                end,
                ['csharp_ls'] = function()
                    local config = {
                        handlers = {
                            ["textDocument/definition"] = require('csharpls_extended').handler,
                            ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
                        },
                    }

                    require('lspconfig').csharp_ls.setup(capabilities(config))
                end
            },
        })
    end,
}

local blinkcmp = {
    'Saghen/blink.cmp',
    lazy = false,
    version = '*',
    ---@type blink.cmp.Config
    opts = {
        sources = {
            default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    score_offset = 100,
                }
            },
        },
        keymap = { preset = 'default' },
        completion = {
            documentation = {
                auto_show = true,
                window = { border = 'rounded' },
            },
        },
    }
}

local trouble = {
    'folke/trouble.nvim',
    event = 'LspAttach',
    ---@type trouble.Config
    opts = {
        auto_refresh = false,
        focus = true,
        preview = { scratch = false },
    },
}

return {
    lsp,
    blinkcmp,
    trouble,
    {
        'artemave/workspace-diagnostics.nvim',
        event = 'LspAttach'
    }
}
