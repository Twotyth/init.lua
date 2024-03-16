local ut = require('twoty.utils')
-- colors
local diff_add = { bg = '#223929' }
local diff_delete = { bg = '#392222', fg = 'none', gui = 'none' }
local diff_change = { bg = '#212140', gui = 'none' }
local diff_add_lighter = { bg = '#2f5f3a' }
local diff_delete_lighter = { bg = '#573237' }
local diff_change_lighter = { bg = '#2e3e5e' }

local property = { fg = '#70cddc' }


return {
    {
        'yazeed1s/oh-lucy.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            local colors = require('oh-lucy-evening.colors')

            colors.dark = '#1b1b1b'
            colors.black = colors.dark
            colors.bg = '#212121'
            colors.none = colors.bg
            colors.line_bg = colors.bg
            colors.gutter_bg = colors.bg
            colors.blue_type = '#C191FF'
            colors.red_key_w = '#6c95eb'
            colors.boolean = '#6c95eb'
            colors.pink = '#ed94c0'
            colors.visual_select_bg = '#343453'
            -- colors.diff_change = diff_change_lighter.bg


            local oh_theme = require('oh-lucy-evening.theme')

            oh_theme.base.Structure = { fg = colors.blue_type }
            oh_theme.base.Constant = { fg = property.fg, style = 'bold' }
            oh_theme.base.Method = oh_theme.base.Function
            oh_theme.base.DiffAdd = diff_add
            oh_theme.base.DiffDelete = diff_delete
            oh_theme.base.DiffChange = diff_change
            oh_theme.base.NormalFloat.bg = colors.bg
            oh_theme.base.Search = { bg = '#08335E', fg = 'none' }

            oh_theme.base["@boolean"] = { fg = colors.boolean }
            oh_theme.base["@number"] = { fg = colors.pink }
            oh_theme.base["@field"] = property
            oh_theme.base["@property"] = property
            oh_theme.base["@variable.member"] = property
            oh_theme.base["@variable.parameter"] = { fg = colors.fg, style = 'italic' }
            oh_theme.base["@namespace"] = { fg = colors.fg }
            oh_theme.base["@lsp.type.struct"] = { fg = '#E1BFFF' }
            oh_theme.base["@lsp.type.enum"] = { fg = '#E1BFFF' }


            oh_theme.plugins.DiagnosticSignHint.bg = oh_theme.plugins.DiagnosticSignHint.fg
            oh_theme.plugins.DiagnosticSignError.bg = oh_theme.plugins.DiagnosticSignError.fg
            oh_theme.plugins.DiagnosticSignWarn.bg = oh_theme.plugins.DiagnosticSignWarn.fg
            oh_theme.plugins.DiagnosticSignInfo.bg = oh_theme.plugins.DiagnosticSignHint.fg

            oh_theme.plugins.GitSignsAdd = { fg = diff_add_lighter.bg }
            oh_theme.plugins.GitSignsChange = { fg = diff_change_lighter.bg }
            oh_theme.plugins.GitSignsDelete = { fg = diff_delete_lighter.bg }

            oh_theme.plugins.GitSignsAddInline = diff_add_lighter
            oh_theme.plugins.GitSignsAddLnInline = diff_add_lighter
            oh_theme.plugins.GitSignsAddVirtLnInline = diff_add_lighter
            oh_theme.plugins.GitSignsAddLnVirtLnInLine = diff_add_lighter

            oh_theme.plugins.GitSignsDeleteInline = diff_delete_lighter
            oh_theme.plugins.GitSignsDeleteLnInline = diff_delete_lighter
            oh_theme.plugins.GitSignsDeleteVirtLnInline = diff_delete_lighter
            oh_theme.plugins.GitSignsDeleteLnVirtLnInLine = diff_delete_lighter

            oh_theme.plugins.GitSignsChangeInline = diff_add_lighter
            oh_theme.plugins.GitSignsChangeLnInline = diff_add_lighter
            oh_theme.plugins.GitSignsChangeVirtLnInline = diff_add_lighter
            oh_theme.plugins.GitSignsChangeLnVirtLnInLine = diff_add_lighter



            oh_theme.plugins.NeogitBranch = { fg = colors.yellow, style = 'bold' }
            oh_theme.plugins.NeogitFold = { fg = colors.comment }
            oh_theme.plugins.NeogitCursorLine = { bg = colors.none }

            oh_theme.plugins.NeogitDiffAdd.bg = diff_add.bg
            oh_theme.plugins.NeogitDiffDelete.bg = diff_delete.bg

            oh_theme.plugins.NeogitChangeModified = { fg = colors.comment, style = 'italic' }
            oh_theme.plugins.NeogitChangeAdded = { fg = colors.green, style = 'italic' }
            oh_theme.plugins.NeogitChangeDeleted = { fg = colors.red_err, style = 'italic' }



            oh_theme.plugins.TelescopeResultClass = { fg = colors.blue_type }
            oh_theme.plugins.TelescopeResultField = property
            oh_theme.plugins.TelescopeResultStruct = oh_theme.base.Structure
            oh_theme.plugins.TelescopeResultMethod = oh_theme.base.Function


            vim.cmd.colorscheme('oh-lucy-evening')

            ut.highlight_g('@lsp.mod.static', { italic = true })
            ut.highlight_g('@lsp.type.field', { link = '@variable.member' })
            ut.highlight_g('@lsp.type.property', { link = '@variable.member' })
            ut.highlight_g('@lsp.type.namespace', { link = '@variable' })
            ut.highlight_g('@lsp.type.keyword', { link = '@keyword' })
            ut.highlight_g('@lsp.type.parameter', { link = '@variable.parameter' })
            ut.highlight_g('@lsp.typemod.function.declaration', { bold = true })


            -- ut.highlight_g('NeogitStatusContext', { fg = colors.black1 })
            ut.highlight_g('IncSearch', { link = 'Search' })
            ut.highlight_g('TroublePreview', { link = 'Search' })

            -- oh-lucy doesn't set it up
            local lighterVisual = { bg = '#333338' }
            ut.highlight_g("LspReferenceText", lighterVisual)
            ut.highlight_g("LspReferenceRead", lighterVisual)
            ut.highlight_g("LspReferenceWrite", lighterVisual)
        end,
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end
    },
    {
        'levouh/tint.nvim',
        event = 'UIEnter',
        config = function()
            ---@type TintUserConfiguration
            require('tint').setup({
                tint = -7,
                tint_background_colors = true,
            })
        end
    }
}
