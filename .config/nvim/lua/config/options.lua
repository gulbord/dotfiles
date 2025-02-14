local set = vim.opt

set.number = true
set.relativenumber = true
set.mouse = "a"

-- Both need to be true to have smartcase
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.cursorline = true

set.textwidth = 80
set.expandtab = true
set.tabstop = 2
set.softtabstop = -1
set.shiftwidth = 0

set.termguicolors = true

set.foldenable = false

-- Diagnostics configuration
set.signcolumn = "number"

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
