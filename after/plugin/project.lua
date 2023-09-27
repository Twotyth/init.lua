require("project_nvim").setup {
    detection_methods = {"lsp"},
    patterns = {} 
}

require('telescope').load_extension('projects')

-- recent projects
vim.keymap.set('n', '<leader>p', function ()
     require'telescope'.extensions.projects.projects{}
end)
