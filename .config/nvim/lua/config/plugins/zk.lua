return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "telescope",
      lsp = {
        config = {
          cmd = { "zk", "lsp" },
          name = "zk",
        },
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    })

    vim.keymap.set(
      "n",
      "<leader>zn",
      "<cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>",
      { desc = "New zk note with title" }
    )
    vim.keymap.set(
      "n",
      "<leader>zo",
      "<cmd>ZkNotes { sort = { 'modified' } }<CR>",
      { desc = "Show zk notes" }
    )
    vim.keymap.set(
      "n",
      "<leader>zb",
      "<cmd>ZkBacklinks<CR>",
      { desc = "Open zk backlinks" }
    )
    vim.keymap.set(
      "n",
      "<leader>zl",
      "<cmd>ZkLinks<CR>",
      { desc = "Open zk links" }
    )
  end,
}
