return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({
      extensions = { fzf = {} },
      pickers = {
        find_files = {
          theme = "ivy",
          hidden = true,
        },
        help_tags = { theme = "ivy" },
      },
    })

    require("telescope").load_extension("fzf")

    local tb = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fh", tb.help_tags)
    vim.keymap.set("n", "<leader>fd", tb.find_files)
    vim.keymap.set("n", "<leader>en", function()
      tb.find_files({ cwd = vim.fn.stdpath("config") })
    end)
  end,
}
