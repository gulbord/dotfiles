local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to window right" })

-- Easier copy-paste on the global register
map({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy on clipboard" })
map({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- Remove search highlight
map(
  "n",
  "<CR>",
  ":nohlsearch<CR><CR>",
  { noremap = true, silent = true, nowait = true }
)

-- Quickfix list
map(
  "n",
  "<leader>q",
  "<cmd>botright copen<CR>",
  { desc = "Open quickfix list" }
)
map("n", "<leader>Q", "<cmd>cclose<CR>", { desc = "Close quickfix list" })
map("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Move to next quickfix" })
map("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Move to previous quickfix" })

-- LSP diagnostics
map(
  "n",
  "<leader>e",
  vim.diagnostic.open_float,
  { desc = "Open diagnostic float" }
)

-- LSP references
map("n", "grn", vim.lsp.buf.rename, { desc = "Rename all references" })
map("n", "gra", vim.lsp.buf.code_action, { desc = "Select code action" })
map(
  "n",
  "grr",
  vim.lsp.buf.references,
  { desc = "Add all references to quickfix" }
)
map(
  "i",
  "<C-s>",
  vim.lsp.buf.signature_help,
  { desc = "Display signature info" }
)

-- Small terminal on the bottom
map("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
end, { desc = "Open a small bottom terminal" })

-- Easier exit for terminal mode
map("t", "<esc>", "<C-\\><C-n>", { desc = "Exit terminal" })
