vim.mapleader = ' '
vim.maplocalleader = ' '

-- write file and source if lua
vim.keymap.set('n', '<leader><leader>', '<cmd>w<cr><cmd>so<cr>')

-- insert new line on enter in normal mode
vim.keymap.set('n', '<cr>', 'o<esc>')

-- persistant undo
vim.keymap.set('n', 'U', '<C-r>')

-- fast scrolling
vim.keymap.set('n', '<M-up>', 'kkkkk')
vim.keymap.set('n', '<M-down>', 'jjjjj')
vim.keymap.set('n', '<M-left>', 'b')
vim.keymap.set('n', '<M-right>', 'e')

-- remap insert mode to better place
vim.keymap.set('n', 'e', 'i')

-- enter visual mode on shift + arrow
vim.keymap.set({'n', 'i'}, '<S-left>', '<esc>v<left>')
vim.keymap.set({'n', 'i'}, '<S-right>', '<esc>v<right>')
vim.keymap.set({'n', 'i'}, '<S-up>', '<esc>V<up>')
vim.keymap.set({'n', 'i'}, '<S-down>', '<esc>V<down>')

-- move lines on ctrl + arrow
vim.keymap.set({'n', 'i', 'v'}, '<C-up>', '<cmd>m-2<cr>')
vim.keymap.set({'n', 'i', 'v'}, '<C-down>', '<cmd>m+1<cr>')

-- exit visual mode on leader
vim.keymap.set('v', '<leader>', '<esc>')

-- jump to eol or sol on one key
vim.keymap.set({'n', 'v'}, '4', '$')
vim.keymap.set({'n', 'v'}, '6', '^')


-- debinded
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('v', '<S-up>', '<up>')
vim.keymap.set('v', '<S-down>', '<down>')
