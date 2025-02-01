vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Easier copy-paste on the global register
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p')

-- Remove search highlight
vim.keymap.set(
  "n",
  "<C-c>",
  ":noh<CR>",
  { noremap = true, silent = true, nowait = true }
)

-- Quickfix list
vim.keymap.set("n", "<leader>q", "<cmd>botright copen<CR>")
vim.keymap.set("n", "<leader>Q", "<cmd>cclose<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<leader>d", "<cmd>cdo")

-- LSP references
vim.keymap.set("n", "grn", vim.lsp.buf.rename)
vim.keymap.set("n", "gra", vim.lsp.buf.code_action)
vim.keymap.set("n", "grr", vim.lsp.buf.references)
vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help)

-- Small terminal on the bottom
vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
end)
