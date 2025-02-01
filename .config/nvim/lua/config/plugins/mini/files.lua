local files = require("mini.files")

local M = {}

files.setup({
  mappings = {
    synchronize = "w",
    go_in_plus = "<CR>",
  },
})

-- Dotfiles filters...
local show_dotfiles = true
local filter_show = function()
  return true
end
local filter_hide = function(fs_entry)
  return not vim.startswith(fs_entry.name, ".")
end
-- ... to use in this toggle
local toggle_dotfiles = function()
  show_dotfiles = not show_dotfiles
  local new_filter = show_dotfiles and filter_show or filter_hide
  files.refresh({ content = { filter = new_filter } })
end

-- Open every kind of file with 'o'
local gio_open = function()
  local fs_entry = (files.get_fs_entry() or {}).path
  if not fs_entry then
    return
  end
  vim.notify(vim.inspect(fs_entry))
  vim.fn.system(string.format("gio open '%s'", fs_entry.path))
end

-- Set focused directory as current working directory
local set_cwd = function()
  local path = (files.get_fs_entry() or {}).path
  if path == nil then
    return vim.notify("Cursor is not on valid entry")
  end
  vim.fn.chdir(vim.fs.dirname(path))
end

-- Yank in register full path of entry under cursor
local yank_path = function()
  local path = (files.get_fs_entry() or {}).path
  if path == nil then
    return vim.notify("Cursor is not on valid entry")
  end
  vim.fn.setreg(vim.v.register, path)
end

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local buf = args.data.buf_id
    vim.keymap.set(
      "n",
      "g.",
      toggle_dotfiles,
      { buffer = buf, desc = "Toggle dotfiles" }
    )
    vim.keymap.set(
      "n",
      "-",
      files.close,
      { buffer = buf, desc = "Close MiniFiles" }
    )
    vim.keymap.set("n", "o", gio_open, { buffer = buf, desc = "Open with gio" })
    vim.keymap.set("n", "g~", set_cwd, { buffer = buf, desc = "Set cwd" })
    vim.keymap.set("n", "gy", yank_path, { buffer = buf, desc = "Yank path" })
  end,
})

M.setup = function()
  vim.keymap.set("n", "-", files.open, { desc = "Open MiniFiles" })
end

return M
