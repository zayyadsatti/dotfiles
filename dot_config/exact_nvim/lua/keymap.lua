 
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':qa<CR>')
vim.keymap.set('n', '<leader>x', ':xa<CR>')

vim.keymap.set('i', '<C-y>', '<Esc>yy p<CR>gi')

vim.keymap.set('i', '<C-a>', '<Home>')
vim.keymap.set('i', '<C-e>', '<End>')
vim.keymap.set('i', '<C-n>', '<Down>')
vim.keymap.set('i', '<C-p>', '<Up>')
vim.keymap.set('i', '<C-f>', '<Right>')
vim.keymap.set('i', '<C-b>', '<Left>')
vim.keymap.set('i', '<C-k>', '<Esc>c$')

vim.keymap.set('i', '<A-b>', '<C-Left>')
vim.keymap.set('i', '<A-f>', '<C-Right>')

