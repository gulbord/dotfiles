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

    vim.keymap.set("n", "<leader>fh", builtin.help_tags)
    vim.keymap.set("n", "<leader>fd", builtin.find_files)
    vim.keymap.set("n", "<leader>en", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end)

    -- Custom pickers
    require("config.telescope.multigrep").setup()
  end,
}
