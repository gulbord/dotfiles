return {
  "Vigemus/iron.nvim",
  config = function()
    local iron = require("iron.core")

    iron.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          sh = {
            command = {"zsh"}
          }
        },
        repl_open_cmd = require("iron.view").split("40%"),
      },
      keymaps = {
        send_motion = "<leader>sc",
        visual_send = "<leader>sc",
        send_file = "<leader>sf",
        send_line = "<leader>sl",
        send_until_cursor = "<leader>su",
        send_mark = "<leader>sm",
        mark_motion = "<leader>mc",
        mark_visual = "<leader>mc",
        remove_mark = "<leader>md",
        cr = "<leader>s<CR>",
        interrupt = "<leader>s<leader>",
        exit = "<leader>sq",
        clear = "<leader>cl",
      },
      highlight = {
        italic = false
      },
      ignore_blank_lines = true,
    })

    vim.keymap.set("n", "<leader>rs", "<cmd>IronRepl<CR>")
    vim.keymap.set("n", "<leader>rr", "<cmd>IronRestart<CR>")
    vim.keymap.set("n", "<leader>rf", "<cmd>IronFocus<CR>")
    vim.keymap.set("n", "<leader>rh", "<cmd>IronHide<CR>")
  end
}
