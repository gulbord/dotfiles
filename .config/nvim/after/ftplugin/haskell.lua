local ht = require("haskell-tools")
local bufnr = vim.api.nvim_get_current_buf()
local opts = {
  noremap = true,
  silent = true,
  buffer = bufnr,
}

-- HLS relies heavily on codeLenses, so auto-refresh is enabled
vim.keymap.set("n", "<space>cl", vim.lsp.codelens.run, opts)
-- Hoogle search for the type signature of the definition
vim.keymap.set("n", "<space>hs", ht.hoogle.hoogle_signature, opts)
-- Evaluate all code snippets
vim.keymap.set("n", "<space>ea", ht.lsp.buf_eval_all, opts)
-- Toggle a GHCi repl for the current package
vim.keymap.set("n", "<localleader>rr", ht.repl.toggle, opts)
-- Toggle a GHCi repl for the current buffer
vim.keymap.set(
  "n", "<localleader>rf",
  function()
    ht.repl.toggle(vim.api.nvim_buf_get_name(0))
  end,
  opts
)
vim.keymap.set("n", "<localleader>rq", ht.repl.quit, opts)
