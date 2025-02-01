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
        send_motion = "<localleader>sc",
        visual_send = "<localleader>sc",
        send_file = "<localleader>sf",
        send_line = "<localleader>sl",
        send_until_cursor = "<localleader>su",
        send_mark = "<localleader>sm",
        mark_motion = "<localleader>mc",
        mark_visual = "<localleader>mc",
        remove_mark = "<localleader>md",
        cr = "<localleader>s<CR>",
        interrupt = "<localleader>s<leader>",
        exit = "<localleader>sq",
        clear = "<localleader>cl",
      },
      highlight = {
        italic = false
      },
      ignore_blank_lines = true,
    })

    vim.keymap.set("n", "<localleader>rs", "<cmd>IronRepl<CR>")
    vim.keymap.set("n", "<localleader>rr", "<cmd>IronRestart<CR>")
    vim.keymap.set("n", "<localleader>rf", "<cmd>IronFocus<CR>")
    vim.keymap.set("n", "<localleader>rh", "<cmd>IronHide<CR>")
    vim.keymap.set(
      "v",
      "<localleader>sv",
      ":lua require('iron.core').visual_send()<CR><Esc>"
    )
  end
}
