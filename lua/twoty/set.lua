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
vim.opt.signcolumn = "yes:2"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.cmd('lan en_US.UTF-8');

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0


-- vim.opt.fold

vim.o.foldlevelstart = 1000
vim.o.foldlevel = 1000
vim.o.foldenable = true;
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldcolumn = '0'
vim.opt.foldtext = ''

local max_width = math.max(math.floor(vim.o.columns * 0.7), 100)
local max_height = math.max(math.floor(vim.o.lines * 0.3), 30)
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview


---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or 'rounded'
    opts.max_width = opts.max_width or max_width
    opts.max_height = opts.max_height or max_height
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local signs = {
  { name = 'DiagnosticSignError', text = ' ' },
  { name = 'DiagnosticSignWarn', text = ' ' },
  { name = 'DiagnosticSignHint', text = '󰂕 ' },
  { name = 'DiagnosticSignInfo', text = ' ' },
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
    virtual_text = true
})
