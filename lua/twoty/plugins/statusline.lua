return {
    'tamton-aquib/staline.nvim',
    config = function()
        require('staline').setup({
            sections = {
                left = { '- ', '-mode', 'left_sep_double', ' ', 'branch', ' ', { 'StalineNone', 'file_name' } },
                mid = {},
                right = { 'lsp', 'right_sep_double', '-line_column' },
            },
            defaults = {
                true_colors = true
            }
        })
    end
}
