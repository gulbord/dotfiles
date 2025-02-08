local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values

local M = {}

local live_multigrep = function(opts)
  opts = opts or {}

  -- If opts.cwd is not set, set it to git root or active buffer's directory
  if not opts.cwd then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    if vim.v.shell_error == 0 then
      opts.cwd =
        string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
    else
      opts.cwd = vim.uv.cwd()
    end
  end

  local finder = finders.new_async_job({
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil -- do nothing
      end

      -- Split first pattern and filename pattern with two spaces
      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }
      -- Grep on the first piece
      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end
      -- Glob files on the second piece
      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end

      return vim
        .iter({
          args,
          {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
        })
        :flatten()
        :totable()
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  })

  pickers
    .new(opts, {
      debounce = 100,
      prompt_title = "Multi Grep",
      finder = finder,
      previewer = conf.grep_previewer(opts),
      sorter = require("telescope.sorters").empty(), -- sorting handled by rg
    })
    :find()
end

M.setup = function()
  vim.keymap.set(
    "n",
    "<leader>fg",
    live_multigrep,
    { desc = "Search with grep/glob" }
  )
end

return M
