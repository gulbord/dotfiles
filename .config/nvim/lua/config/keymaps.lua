vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to window right" })

-- Easier copy-paste on the global register
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy on clipboard" })
vim.keymap.set(
  { "n", "x" },
  "<leader>p",
  '"+p',
  { desc = "Paste from clipboard" }
)

-- Remove search highlight
vim.keymap.set(
  "n",
  "<C-c>",
  ":noh<CR>",
  { noremap = true, silent = true, nowait = true }
)

-- Quickfix list
vim.keymap.set(
  "n",
  "<leader>q",
  "<cmd>botright copen<CR>",
  { desc = "Open quickfix list" }
)
vim.keymap.set(
  "n",
  "<leader>Q",
  "<cmd>cclose<CR>",
  { desc = "Close quickfix list" }
)
vim.keymap.set(
  "n",
  "<M-j>",
  "<cmd>cnext<CR>",
  { desc = "Move to next quickfix" }
)
vim.keymap.set(
  "n",
  "<M-k>",
  "<cmd>cprev<CR>",
  { desc = "Move to previous quickfix" }
)

-- LSP references
vim.keymap.set(
  "n",
  "grn",
  vim.lsp.buf.rename,
  { desc = "Rename all references" }
)
vim.keymap.set(
  "n",
  "gra",
  vim.lsp.buf.code_action,
  { desc = "Select code action" }
)
vim.keymap.set(
  "n",
  "grr",
  vim.lsp.buf.references,
  { desc = "Add all references to quickfix" }
)
vim.keymap.set(
  "i",
  "<C-s>",
  vim.lsp.buf.signature_help,
  { desc = "Display signature info" }
)

-- Small terminal on the bottom
vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
end, { desc = "Open a small bottom terminal" })

-- Easier exit for terminal mode
vim.keymap.set(
  "t",
  "<localleader><esc>",
  "<C-\\><C-n>",
  { desc = "Exit terminal" }
)
