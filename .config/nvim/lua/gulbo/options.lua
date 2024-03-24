vim.opt.number = true
vim.opt.mouse = "a"

-- both need to be true to have smartcase
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.textwidth = 80
vim.opt.splitbelow = true
vim.opt.cursorline = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = -1
vim.opt.shiftwidth = 0
vim.opt.autoindent = true

vim.opt.termguicolors = true

vim.g.python3_host_prog = "/usr/bin/python3"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "c,cpp",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.cindent = true
  end
})
