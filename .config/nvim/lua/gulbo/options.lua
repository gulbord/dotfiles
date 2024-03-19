vim.opt.number = true
vim.opt.mouse = "a"

-- both need to be true to have smartcase
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.textwidth = 80
vim.opt.splitbelow = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.termguicolors = true

vim.g.python3_host_prog = "/usr/bin/python3"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "bib,bug,css,lua,markdown,r,rmd,stan,tex",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end
})
