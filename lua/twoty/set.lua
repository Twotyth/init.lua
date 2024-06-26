vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = 'C:/User/timka/AppData/Local/nvim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 15
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.cmd('lan en_US');

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0


-- vim.opt.fold

local max_width = math.max(math.floor(vim.o.columns * 0.7), 100)
local max_height = math.max(math.floor(vim.o.lines * 0.3), 30)
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview


function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or 'rounded'
    opts.max_width = opts.max_width or max_width
    opts.max_height = opts.max_height or max_height
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local signs = {
  { name = 'DiagnosticSignError', text = ' ' },
  { name = 'DiagnosticSignWarn', text = ' ' },
  { name = 'DiagnosticSignHint', text = ' ' },
  { name = 'DiagnosticSignInfo', text = ' ' },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {
        texthl = sign.name,
        text = sign.text,
        lineh = sign.name,
        numhl = '',
    })
end

vim.diagnostic.config({
    update_in_insert = true,
    severity_sort = true,
})
