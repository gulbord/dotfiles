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

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "ocaml" },
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local fname = vim.api.nvim_buf_get_name(args.buf)
        vim.keymap.set("n", "<leader>uf", function()
          iron.send(ft, '#use "' .. fname .. '"')
        end, { silent = true, desc = "Load current module in utop" })
      end,
    })
  end,
}
