vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- easier copy-paste on the global register
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p')

-- remove search highlight
vim.keymap.set("n", "<CR>", ":noh<CR><CR>")

-- exit terminal
vim.keymap.set("t", "<C-space>", "<C-\\><C-n>", { noremap = true })
