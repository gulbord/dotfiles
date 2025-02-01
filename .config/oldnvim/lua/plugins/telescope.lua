return {
  "nvim-telescope/telescope.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    -- Load extensions
    telescope.load_extension("fzf")
    -- Set keymaps
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
  end,
}
