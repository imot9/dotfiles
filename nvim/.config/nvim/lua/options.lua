# im sorry
vim.api.nvim_set_keymap('n', 'j', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'l', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';', 'l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', 'j', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'l', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ';', 'l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('o', 'j', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'k', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'l', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', ';', 'l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'h', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'h', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'h', '<nop>', { noremap = true, silent = true })

vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
