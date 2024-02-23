return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            --'meznaric/conmenu',
            --{
            --    'nvim-telescope/telescope-fzf-native.nvim',
            --    build = 'make',
            --    cond = function()
            --        return vim.fn.executable 'make' == 1
            --    end,
            --},
        },
        keys = {
            '<leader>d',
            '<leader>s',
            '<leader>S',
            '<leader>ff',
        },
        config = function ()
            local bi = require('telescope.builtin')
            local function find_types()
                bi.lsp_workspace_symbols({
                    symbols = {'class', 'type', 'struct', 'union', 'interface'}
                })
            end
            local function find_symbols()
                bi.lsp_workspace_symbols({
                    symbols = { 'method', 'function', 'constant', 'field' }
                })
            end

            local opts = { remap = false };
            vim.keymap.set('n', '<leader>d', bi.lsp_definitions)
            vim.keymap.set('n', '<leader>s', find_types, opts)
            vim.keymap.set('n', '<leader>S', find_symbols, opts)
            vim.keymap.set('n', '<leader>ff', bi.find_files, opts)
            --vim.keymap.set('n', '<leader><leader>', '<cmd>ConMenu<cr>', { silent = true })
            --local title =       { '   Telescope  ', nil }
            --local types =       { ' Types     ...', find_types }
            --local symbols =     { '󰊕 Symbols   ...', find_symbols}
            --local files =       { '󰱼 Files     ...', ':Telescope find_files' }
            --vim.g['conmenu#default_menu'] = { title, types, symbols, files }
            --vim.g['conmenu#available_bindings'] = 'tsf'

        end
    },
}
