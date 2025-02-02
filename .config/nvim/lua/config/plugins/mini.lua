return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("config.plugins.mini.files").setup()

    require("mini.icons").setup()

    require("mini.statusline").setup({ use_icons = true })

    require("mini.surround").setup({
      mappings = {
        add = "sa",
        delete = "sd",
        find = "sf",
        find_left = "sF",
        highlight = "sh",
        replace = "sr",
        update_n_lines = "sn",
        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
      -- Number of lines within which surrounding is searched
      n_lines = 20,
      search_method = "cover",
      silent = false,
    })
  end,
}
