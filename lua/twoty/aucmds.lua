local aucmd = require('twoty.utils').aucmd
local update_timer = vim.loop.new_timer()


-- general attach for all lsp-server
local function on_attach(e)
    local opts = { buffer = e.buf, noremap = true }
    vim.keymap.set('n', '<M-cr>', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>t', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('i', '<c-k>', vim.lsp.buf.signature_help, opts)
end

aucmd('LspAttach', { callback = on_attach })

-- highlight on yank
aucmd('TextYankPost', {
    callback = function () vim.highlight.on_yank({ higroup = 'Search', timeout = 100 }) end
})
