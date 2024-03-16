local M = {}


M.map = vim.keymap.set
M.get_buf_mark = vim.api.nvim_buf_get_mark

---@param opts table|nil
function M.map_noremap(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.remap = false
    vim.keymap.set(mode, lhs, rhs, opts)
end


---@param opts table|nil
function M.map_silent(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = true
    vim.keymap.set(mode, lhs, rhs, opts)
end




local augroup = vim.api.nvim_create_augroup('Twoty', {})
function M.aucmd(evt, opts)
    opts = opts or {}
    opts.group = augroup
    vim.api.nvim_create_autocmd(evt, opts)
end

---@param keys string
function M.feedkeys(keys)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), 't', false)
end

function M.flash_region_cur_buf(ns, start_line, end_line)
    -- yank-like highlight
    ns = ns or vim.api.nvim_create_namespace('hltemp')
    vim.highlight.range(0, ns, 'Visual', { start_line, 0 }, { end_line, 200 })
    vim.defer_fn(function()
        vim.api.nvim_buf_clear_namespace(0, ns, start_line, end_line + 1)
    end, 100)
end

function M.highlight_g(higroup, value)
    vim.api.nvim_set_hl(0, higroup, value)
end


return M
