return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      git = {
        ignore = false,
      },
    })

    -- open/focus nvim-tree view
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
    vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>")
    vim.keymap.set("n", "<leader>tg", ":NvimTreeFindFile<CR>")
  end
}
