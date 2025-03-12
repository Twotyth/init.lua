local aucmd = require('twoty.utils').aucmd
local map = require('twoty.utils').map

---@param opts? string|trouble.Mode
--- trouble toggle
local function trt(opts)
    return function ()
        require('trouble').toggle(opts)
    end
end

local noCapabilitiesClient = { }
function noCapabilitiesClient.supports_method(_)
    return false;
end

local function roslyn_patch(client)
    if client.is_hacked or client.name ~= 'roslyn' then
        return
    end
    client.is_hacked = true

    -- let the runtime know the server can do semanticTokens/full now
    client.server_capabilities = vim.tbl_deep_extend("force", client.server_capabilities, {
        semanticTokensProvider = {
            full = true,
        },
    })

    -- monkey patch the request proxy
    local request_inner = client.request
    client.request = function(method, params, handler, req_bufnr)
        if method ~= vim.lsp.protocol.Methods.textDocument_semanticTokens_full then
            return request_inner(method, params, handler)
        end

        local target_bufnr = vim.uri_to_bufnr(params.textDocument.uri)
        local line_count = vim.api.nvim_buf_line_count(target_bufnr)
        local last_line = vim.api.nvim_buf_get_lines(target_bufnr, line_count - 1, line_count, true)[1]

        return request_inner("textDocument/semanticTokens/range", {
            textDocument = params.textDocument,
            range = {
                ["start"] = {
                    line = 0,
                    character = 0,
                },
                ["end"] = {
                    line = line_count - 1,
                    character = string.len(last_line) - 1,
                },
            },
        }, handler, req_bufnr)
    end
end

-- general attach for all lsp-server
local function on_attach(e)
    -- vim.lsp.completion.enable(true, e.data.client_id, 0, { autotrigger = true })

    -- remaps

    ---@type vim.keymap.set.Opts
    local opts = { buffer = e.buf, noremap = true }

    map('n', '<M-cr>', vim.lsp.buf.code_action, opts)
    map('n', '<leader>r', vim.lsp.buf.rename, opts)
    map('i', '<c-k>', vim.lsp.buf.signature_help, opts)
    map('n', '<leader>e', vim.lsp.codelens.run)

    map('n', '<leader>d', trt('lsp_definitions'), opts)
    map('n', '<leader>D', trt('lsp_references'), opts)
    map('n', '<leader>t', trt('lsp_type_definitions'), opts)

    ---@diagnostic disable-next-line: assign-type-mismatch
    map('n', '<leader>p', trt({ mode = 'diagnostics', filter = { buf = 0 } }), opts)
    map('n', '<leader>P', trt('diagnostics'), opts)

    local client = vim.lsp.get_client_by_id(e.data.client_id) or noCapabilitiesClient

    roslyn_patch(client)

    -- populate diags
    require("workspace-diagnostics").populate_workspace_diagnostics(client, e.buf)

    -- conditionals
    if client.supports_method('textDocument/codeLens') then
        aucmd({ 'BufEnter', 'InsertLeave' }, {
            buffer = e.buf,
            callback = function()
                vim.schedule(function() vim.lsp.codelens.refresh({ bufnr = e.buf }) end)
            end
        })
    end

    if client.supports_method('textDocument/inlayHint') then
        local filter = { bufnr = e.buf }
        vim.lsp.inlay_hint.enable(true, { filter = filter })
        map('n', '<leader>i', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(filter), filter)
        end)
    end
end


aucmd('LspAttach', { callback = on_attach })

-- highlight on yank
aucmd('TextYankPost', {
    callback = function ()
        vim.highlight.on_yank({ higroup = 'Search', timeout = 100 })
    end
})
