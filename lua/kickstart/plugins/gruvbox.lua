return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = true,
  opts = {
    terminal_colors = true, -- add neovim terminal colors
    undercurl = false,
    underline = false,
    bold = true,
    contrast = 'hard',
    inverse = false,
  },
  -- init = function()
  --   vim.cmd.colorscheme 'gruvbox'
  --   vim.opt.background = 'light'
  -- end,
}
