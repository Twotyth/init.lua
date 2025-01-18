local aucmd = require('twoty.utils').aucmd
local map = require('twoty.utils').map

---@param opts? string|trouble.Mode
--- trouble toggle
local function trt(opts)
    return function ()
        require('trouble').toggle(opts)
    end
end

-- general attach for all lsp-server
local function on_attach(e)
    -- vim.lsp.completion.enable(true, e.data.client_id, 0, { autotrigger = true })

    -- remaps
    local opts = { buffer = e.buf, noremap = true }

    map('n', '<M-cr>', vim.lsp.buf.code_action, opts)
    map('n', '<leader>r', vim.lsp.buf.rename, opts)
    map('i', '<c-k>', vim.lsp.buf.signature_help, opts)
    map('n', 'si', function()
        ---@diagnostic disable-next-line: missing-parameter
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, opts)

    map('n', 'sl', vim.lsp.codelens.refresh, opts)
    map('n', '<leader>l', vim.lsp.codelens.run, opts)

    map('n', '<leader>d', trt('lsp_definitions'), opts)
    map('n', '<leader>u', trt('lsp_references'), opts)
    map('n', '<leader>t', trt('lsp_type_definitions'), opts)
    map('n', '<leader>i', trt('lsp_implementations_'), opts)

    map('n', '<leader>p', trt({ mode = 'diagnostics', filter = { buf = 0 } }), opts)
    map('n', '<leader>P', trt('diagnostics'), opts)

    -- populate diags
    local client = vim.lsp.get_client_by_id(e.data.client_id) or {}
    require("workspace-diagnostics").populate_workspace_diagnostics(client, e.buf)
end

aucmd('LspAttach', { callback = on_attach })

-- highlight on yank
aucmd('TextYankPost', {
    callback = function () vim.highlight.on_yank({ higroup = 'Search', timeout = 100 }) end
})
