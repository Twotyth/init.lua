vim.mapleader = ' '
vim.maplocalleader = ' '

-- write file and source if lua
--vim.keymap.set('n', '<leader><leader>', '<cmd>w<cr>')

-- insert new line on enter in normal mode
vim.keymap.set('n', '<cr>', 'o<esc>')

-- break to next line
vim.keymap.set('n', '<s-cr>', 'viW"_y')

vim.keymap.set({'n', 'v'}, '<S-up>', '5<up>')
vim.keymap.set({'n', 'v'}, '<S-down>', '5<down>')

-- persistant undo
vim.keymap.set('n', 'U', '<C-r>')

-- move lines on alt + arrow
vim.keymap.set('v', '<A-up>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<A-down>', ":m '>+1<CR>gv=gv")
vim.keymap.set('n', '<A-up>', ":m-2<CR>==")
vim.keymap.set('n', '<A-down>', ":m+1<CR>==")

-- cursor next/prev
vim.keymap.set('n', '{', '<C-o>')
vim.keymap.set('n', '}', '<C-i>')

vim.keymap.set('n', '<A-v>', '<C-v>')

-- debinded
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('v', '<S-up>', '<up>')
vim.keymap.set('v', '<S-down>', '<down>')

vim.keymap.set('n', 'rwp', 'viwpyiw')
vim.keymap.set('n', 'rWp', 'viWpyiW')
vim.keymap.set('n', 'rwP', 'viwPyiw')
vim.keymap.set('n', 'rWP', 'viWPvyiW')



local function on_attach(e)
    local opts = { buffer = e.buf, remap = false }
    vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>t', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end


local TwotyGroup = vim.api.nvim_create_augroup('Twoty', {})
local autocmd = vim.api.nvim_create_autocmd


autocmd('LspAttach', {
    group = TwotyGroup,
    callback = on_attach
})
