---@type number
local picker_index = 1

-- pickers invoke functions to scroll with
---@type function[]
local pickers_funclist

local function picker_next()
    picker_index = picker_index + 1
    if picker_index > #pickers_funclist then
        picker_index = 1
    end
    vim.api.nvim_win_hide(0)
    pickers_funclist[picker_index]()
end


local function picker_prev()
    picker_index = picker_index - 1
    if picker_index == 0 then
        picker_index = #pickers_funclist
    end
    vim.api.nvim_win_hide(0)
    pickers_funclist[picker_index]()
end



return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        keys = { '<leader>d', '<leader>s' },
        config = function ()
            local bi = require('telescope.builtin')
            local theme = require('telescope.themes')
            local function find_types()
                bi.lsp_dynamic_workspace_symbols(
                    theme.get_dropdown({
                        symbols = {
                            'class', 'type', 'struct', 'union', 'interface'
                        },
                    })
                )
            end
            local function find_files()
                bi.find_files( { previewer = false } )
            end

            local function find_symbols()
                bi.lsp_dynamic_workspace_symbols(
                    theme.get_dropdown({
                        symbols = { 'method', 'function', 'constant', 'field' },
                    })
                )
            end

            pickers_funclist = { find_types, find_files, find_symbols }



            vim.keymap.set('n', '<leader>d', bi.lsp_definitions, { remap = false })
            vim.keymap.set('n', '<leader>s', function () picker_index = 1 find_types() end, { remap = false })
            vim.keymap.set('n', '<leader>S', bi.live_grep, { remap = false })

            vim.keymap.set( {'n', 'i'}, '<M-right>', function()
                if vim.bo.ft == 'TelescopePrompt' then
                    picker_next()
                end
            end)
            vim.keymap.set( {'n', 'i'}, '<M-left>', function()
                if vim.bo.ft == 'TelescopePrompt' then
                    picker_prev()
                end
            end)
        end
    },
}
