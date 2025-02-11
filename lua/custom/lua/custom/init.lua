local api = vim.api
local fn = vim.fn

local M = {}

-- Ceci est une adaptation de toggleterm.send_lines_to_terminal
-- le problème c'est que lorsqu'on envoie des lignes de code python vers ipython, il faut virer les lignes vides
-- (c'est plus propre de patcher comme ça plutôt que de forker toggleterm)

--- @param selection_type string
--- @param trim_spaces boolean
--- @param cmd_data table<string, any>
function M.trim_cr_and_send_lines_to_terminal(selection_type, trim_spaces, cmd_data)
  local function delete_empty_lines(input)
    local result = {}
    -- for line in string.gmatch(input, "([^\n]*)\n?") do
    for _, line in pairs(input) do
      if line ~= '' then
        table.insert(result, line)
      end
    end
    return result
  end
  local lazy = require 'toggleterm.lazy'
  local utils = lazy.require 'toggleterm.utils'
  local id = tonumber(cmd_data.args) or 1
  local exec = require('toggleterm').exec
  trim_spaces = trim_spaces == nil or trim_spaces

  vim.validate {
    selection_type = { selection_type, 'string', true },
    trim_spaces = { trim_spaces, 'boolean', true },
    terminal_id = { id, 'number', true },
  }

  local current_window = api.nvim_get_current_win() -- save current window

  local lines = {}
  -- Beginning of the selection: line number, column number
  local start_line, start_col
  if selection_type == 'single_line' then
    start_line, start_col = unpack(api.nvim_win_get_cursor(0))
    -- nvim_win_get_cursor uses 0-based indexing for columns, while we use 1-based indexing
    start_col = start_col + 1
    table.insert(lines, fn.getline(start_line))
  else
    local res = nil
    if string.match(selection_type, 'visual') then
      -- This calls vim.fn.getpos, which uses 1-based indexing for columns
      res = utils.get_line_selection 'visual'
    else
      -- This calls vim.fn.getpos, which uses 1-based indexing for columns
      res = utils.get_line_selection 'motion'
    end
    start_line, start_col = unpack(res.start_pos)
    -- char, line and block are used for motion/operatorfunc. 'block' is ignored
    if selection_type == 'visual_lines' or selection_type == 'line' then
      lines = delete_empty_lines(res.selected_lines)
    elseif selection_type == 'visual_selection' or selection_type == 'char' then
      lines = utils.get_visual_selection(res, true)
    end
  end

  if not lines or not next(lines) then
    return
  end

  if not trim_spaces then
    exec(table.concat(lines, '\n'), id)
  else
    for _, line in ipairs(lines) do
      local l = trim_spaces and line:gsub('^%s+', ''):gsub('%s+$', '') or line
      exec(l, id)
    end
  end

  -- Jump back with the cursor where we were at the beginning of the selection
  api.nvim_set_current_win(current_window)
  -- nvim_win_set_cursor() uses 0-based indexing for columns, while we use 1-based indexing
  api.nvim_win_set_cursor(current_window, { start_line, start_col - 1 })
end

return M
