return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local themes = require("telescope.themes")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = vim.tbl_extend("force", themes.get_ivy(), {
        path_display = { "truncate", "filename_first" },
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
            ["<Esc>"] = "close",
          },
        },
      }),
    })

    telescope.load_extension("fzf")

    vim.keymap.set(
      "n",
      "<leader>fh",
      builtin.help_tags,
      { desc = "Search help pages" }
    )
    vim.keymap.set(
      "n",
      "<leader>fd",
      builtin.find_files,
      { desc = "Search files from cwd" }
    )
    vim.keymap.set("n", "<leader>fc", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Search files under .config/nvim" })
    vim.keymap.set(
      "n",
      "<leader>fb",
      builtin.buffers,
      { desc = "Search buffers" }
    )
    vim.keymap.set(
      "n",
      "<leader>fr",
      builtin.git_files,
      { desc = "Search git repo" }
    )

    -- Custom pickers
    require("config.plugins.telescope.multigrep").setup()
  end,
}
