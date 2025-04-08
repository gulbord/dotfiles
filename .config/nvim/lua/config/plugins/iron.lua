return {
  "Vigemus/iron.nvim",
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          ocaml = {
            command = { "utop" },
            format = function(lines)
              table.insert(lines, ";;\13")
              return lines
            end,
          },
          python = {
            command = { "ipython", "--no-autoindent" },
            format = common.bracketed_paste_python,
            block_dividers = { "# %%", "#%%" },
          },
        },
        repl_filetype = function()
          return "iron"
        end,
        repl_open_cmd = {
          view.split.rightbelow("%30"),
          view.split.vertical.rightbelow("%40"),
        },
        buflisted = false,
      },
      keymaps = {
        toggle_repl_with_cmd_1 = "<leader>rh",
        toggle_repl_with_cmd_2 = "<leader>rv",
        restart_repl = "<leader>rr",
        send_motion = "+",
        visual_send = "+",
        send_line = "++",
        send_file = "+f",
        send_paragraph = "+p",
        send_until_cursor = "+u",
        send_code_block = "+b",
        send_code_block_and_move = "+n",
        interrupt = "<leader>rk",
        exit = "<leader>rq",
        clear = "<leader>rc",
      },
      ignore_blank_lines = true,
    })
  end,
}
