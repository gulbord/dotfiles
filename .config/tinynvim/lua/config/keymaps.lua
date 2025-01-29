vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Better window navigation
vim.keymap.set("n", "<C-H>", "<C-W>h")
vim.keymap.set("n", "<C-J>", "<C-W>j")
vim.keymap.set("n", "<C-K>", "<C-W>k")
vim.keymap.set("n", "<C-L>", "<C-W>l")

-- Easier copy-paste on the global register
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p')

-- Remove search highlight
vim.keymap.set(
  "n",
  "<C-C>",
  ":noh<CR>",
  { noremap = true, silent = true, nowait = true }
)
