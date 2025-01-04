vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.typ",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(buf, "filetype", "typst")
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typst",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.keymap.set("n", "<localleader>v", "", {
      buffer = buf,
      noremap = true,
      silent = true,
      callback = function()
        vim.cmd("silent !zathura " .. vim.fn.expand("%:p:r") .. ".pdf &")
      end
    })
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "c,cpp",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.cindent = true
  end
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  callback = function()
    vim.cmd("silent !ruff check --select I --fix %")
    vim.cmd("silent !ruff format --config line-length=80 --quiet %")
    vim.cmd("edit")
  end
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.h,*.hpp,*.c,*.cpp",
  callback = function()
    vim.cmd("silent !clang-format -i %")
    vim.cmd("edit")
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "haskell",
  callback = function()
    vim.opt_local.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.hs",
  callback = function()
    vim.cmd("silent !fourmolu -i %")
    vim.cmd("edit")
  end
})
