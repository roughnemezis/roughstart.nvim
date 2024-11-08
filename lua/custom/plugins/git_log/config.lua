local M = {}

print("Config from git_log.config.lua was sourced")

function M.config()
  --   -- Define the command to call open_git_log_split
  --   vim.cmd('command! GitLog lua require("custom.plugins.git_log").open_git_log_split()')
  --
  --   -- Define the autocommand for the FugitiveChanged event
  --   vim.api.nvim_create_autocmd("User", {
  --     pattern = "FugitiveChanged",
  --     callback = function()
  --       git_log.open_git_log_split()
  --     end
  --   })
  print("Calling config from git_log.config.lua")
end

return M
