local augroup = vim.api.nvim_create_augroup('Twoty', {})
local function aucmd(evt, opts)
    opts = opts or {}
    opts.group = augroup
    vim.api.nvim_create_autocmd(evt, opts)
end


-- general attach for all lsp-servers
local function on_attach(e)
    local opts = { buffer = e.buf, remap = false }
    vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>t', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

aucmd('LspAttach', { callback = on_attach })

-- highlight on yank
aucmd('TextYankPost', {
    callback = function () vim.highlight.on_yank({ higroup = 'Visual', timeout = 80 }) end
})

aucmd('ColorScheme', {
    callback = function()
        require('twoty.plugins.illuminate').setup_higroups()
        require('twoty.plugins.git').setup_higroups()
    end
})
