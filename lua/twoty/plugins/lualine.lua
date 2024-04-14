return {
    'nvim-lualine/lualine.nvim',
    priority = 999,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff' },
            lualine_c = { 'filename' },
            lualine_x = { 'diagnostics', 'encoding', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' },
        }
    }
}
