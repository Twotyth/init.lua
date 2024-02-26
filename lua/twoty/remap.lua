vim.mapleader = ' '
vim.maplocalleader = ' '

local silent_opts = { silent = true }

--vim.keymap.set('n', '<leader><leader>', '<cmd>w<cr>')

-- insert new line on enter in normal mode
vim.keymap.set('n', '<cr>', 'o<esc>')

-- break to next line
vim.keymap.set('n', '<s-cr>', 'viW"_y<cr>')


vim.keymap.set({'n', 'v'}, '<S-up>', '5<up>')
vim.keymap.set({'n', 'v'}, '<S-down>', '5<down>')

-- persistant undo
vim.keymap.set('n', 'U', '<C-r>')

-- move lines on alt + arrow
vim.keymap.set('v', '<A-up>',  ":m '<-2<CR>gv=gv", silent_opts)
vim.keymap.set('v', '<A-down>', ":m '>+1<CR>gv=gv", silent_opts)
vim.keymap.set('n', '<A-up>', ":m-2<CR>==", silent_opts)
vim.keymap.set('n', '<A-down>', ":m+1<CR>==", silent_opts)

-- cursor next/prev
vim.keymap.set('n', '{', '<C-o>')
vim.keymap.set('n', '}', '<C-i>')

vim.keymap.set('n', '<A-v>', '<C-v>')

-- debinded
vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', 'rwp', 'viwpyiw')
vim.keymap.set('n', 'rWp', 'viWpyiW')
vim.keymap.set('n', 'rwP', 'viwPyiw')
vim.keymap.set('n', 'rWP', 'viWPvyiW')

-- make d just delete, leave x for cut
vim.keymap.set('n', 'd', '"_d')
