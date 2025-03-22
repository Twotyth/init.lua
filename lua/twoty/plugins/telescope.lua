-- pickers invoke functions to scroll with
---@type function[]
local pickers_funclist

---@type string
local picker_search

---@type number
local picker_index = 1


local function scroll_open(tbufnr)
    local picker = require('telescope.actions.state').get_current_picker(tbufnr)
    picker_search = picker:_get_prompt()
    vim.api.nvim_win_hide(0)
    pickers_funclist[picker_index]()
end

local function picker_next(tbufnr)
    picker_index = picker_index + 1
    if picker_index > #pickers_funclist then
        picker_index = 1
    end
    scroll_open(tbufnr)
end


local function picker_prev(tbufnr)
    picker_index = picker_index - 1
    if picker_index == 0 then
        picker_index = #pickers_funclist
    end
    scroll_open(tbufnr)
end


return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        cmd = 'Telescope',
        keys = { '<leader>d', '<leader>s', '<leader>S' },
        config = function ()
            local global_defaults = {
                mappings = {
                    i = {
                        ['<M-right>'] = picker_next,
                        ['<M-left>'] = picker_prev,
                        ['<esc>'] = require('telescope.actions').close,
                    },
                    n = {
                        ['<M-right>'] = picker_next,
                        ['<M-left>'] = picker_prev,
                    },
                },
                path_display = { 'smart', 'filename_first' }
            }

            require('telescope').setup({
                pickers = {
                    find_files = { path_display = { "smart", "filename_first" }, },
                    -- lsp_dynamic_workspace_symbols = {
                    --     entry_maker = require('twoty.custom.telescope-symbol-entry-maker').maker()
                    -- }
                },
                defaults = require('telescope.themes').get_ivy(global_defaults)
            })

            local bi = require('telescope.builtin')
            local theme = require('telescope.themes')


            local function find_types()
                local opts = {
                    symbols = {
                        'class', 'type', 'struct', 'union', 'interface'
                    },
                    prompt_title = 'Types',
                    default_text = picker_search
                }
                bi.lsp_dynamic_workspace_symbols(theme.get_dropdown(opts))
            end
            local function find_files()
                bi.find_files(
                    theme.get_dropdown({
                        previewer = false,
                        default_text = picker_search
                    })
                )
            end
            local function find_symbols()
                bi.lsp_dynamic_workspace_symbols(
                    theme.get_dropdown({
                        symbols = { 'method', 'function', 'constant', 'field' },
                        prompt_title = 'Symbols',
                        default_text = picker_search
                    })
                )
            end

            pickers_funclist = { find_types, find_files, find_symbols }

            local ut = require('twoty.utils')
            ut.noremap('n', '<leader>s', function() pickers_funclist[picker_index]() end)
            ut.noremap('n', '<leader>S', bi.live_grep)
            ut.noremap('n', '<leader>h', bi.help_tags)
        end
    },
}
