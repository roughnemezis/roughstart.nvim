local M = {}

M.config = require 'custom.plugins.git_log.config'

local git_log_win_id = nil

local win_id = vim.api.nvim_get_current_win()

vim.api.nvim_set_current_win(win_id)

function M.open_git_log_split()
  local work_window = vim.api.nvim_get_current_win()
  if git_log_win_id == nil or not vim.api.nvim_win_is_valid(git_log_win_id) then
    vim.cmd('vert Git log --oneline --decorate --graph --all')
    git_log_win_id = vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(work_window)    --retour à la fenêtre de travail
  else
    vim.api.nvim_set_current_win(git_log_win_id) --retour à la fenêtre de travail
    vim.cmd('0Git log --oneline --decorate --graph --all')
    vim.api.nvim_set_current_win(work_window)    --retour à la fenêtre de travail
  end
end

return M
