
-- setting according to file ext
-- Line numbering
vim.wo.number = true -- show numbering
vim.wo.relativenumber = true-- show relative numbering

-- Tab Settings
vim.opt.tabstop = 2 -- visual width of tab
vim.opt.softtabstop = 2 -- taby key behaves like 2 spaces
vim.opt.shiftwidth = 2 -- indent size
vim.opt.expandtab = true -- use spaces, not tab

-- Searching
vim.opt.ignorecase = true -- ignore case
vim.opt.smartcase = true -- if use upper case, change to case sensitive
vim.opt.hlsearch = true -- highlight search result
vim.opt.incsearch = true -- highlight first match as i type
vim.opt.magic = true-- for regex turn magic on 

-- indent settings
vim.opt.autoindent = true-- copies indent of parent line
vim.opt.smartindent = true -- add indent after { 

-- misc
vim.opt.scrolloff = 5 
vim.opt.history = 500

vim.opt.guicursor = "v-c-sm:hor20,i-ci-ve:hor20,r-cr-o:hor20"

vim.opt.laststatus = 0

vim.cmd('syntax on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

