vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>e", ":Lex 30<cr>")

vim.keymap.set({"n", "x"}, "<leader>y", '"+y')
vim.keymap.set({"n", "x"}, "<leader>p", '"+p')

vim.keymap.set("n", "<CR>", ":noh<CR><CR>")
