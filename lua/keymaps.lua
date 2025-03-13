-- [[ Basic Keymaps ]]
-- Sortir du mode insertion
vim.keymap.set({ 'i' }, '<c-c>', '<nop>')
vim.keymap.set({ 'i', 'v' }, 'jk', '<esc>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<A-l>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- éditer init.lua
vim.keymap.set({ 'n' }, '<leader>ev', '<Cmd>split $MYVIMRC<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', { desc = 'Move focus to the upper window' })
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
--
-- vim: ts=2 sts=2 sw=2 et

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set('n', 'fd', vim.diagnostic.open_float)

-- ******************* plugins *******************************

-- ##############      OIL             ##########################
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '+', '<CMD>Oil --float<CR>', { desc = 'Open parent directory - in floating window' })

-- ##############      IRON             ##########################
-- vim.keymap.set({ 'n' }, '<C-x><C-v>', ':IronRepl<CR>')
-- vim.keymap.set({ 'n' }, '<C-x><C-h>', ':IronHide<CR>')
-- vim.keymap.set({ 'n' }, '<C-x><C-f>', ':IronFocus<CR>')
--
-- ##############      tmux sender             ##########################
-- local tmux_sender = require 'custom.plugins.tmux-sender'
-- vim.api.nvim_create_user_command('TmuxSendLine', tmux_sender.send_current_line_to_tmux, {})
-- vim.api.nvim_create_user_command('TmuxSendSelection', tmux_sender.send_visual_selection_to_tmux, { range = true })
--
-- vim.keymap.set({ 'n' }, '<C-y><C-y>', ':TmuxSendLine<CR>j', { desc = 'Execute current line in tmux pane and move to next' })
-- vim.keymap.set({ 'v' }, '<C-y>', ':TmuxSendSelection<CR>`>', { desc = 'Execute current visual selection in tmux pane' })
-- vim.keymap.set({ 'i' }, '<C-y>', '<esc>:TmuxSendLine<CR>a', { desc = 'Execute current line in insert mode' })

-- vim.keymap.set({ 'v' }, '<C-y>', ':TmuxSendSelection<CR>`>', { desc = 'Execute current visual selection in tmux pane' })

vim.keymap.set({ 'n' }, '<leader>xt', ':TermSelect<CR>')

vim.keymap.set({ 'n' }, '<leader>xa', ':ToggleTerm direction=horizontal<CR>')
vim.keymap.set({ 'n' }, '<leader>xb', ':2ToggleTerm direction=horizontal<CR>')
vim.keymap.set({ 'n' }, '<leader>xc', ':3ToggleTerm direction=horizontal<CR>')

vim.keymap.set({ 'n' }, '<leader>va', ':ToggleTerm direction=vertical<CR>')
vim.keymap.set({ 'n' }, '<leader>vb', ':2ToggleTerm direction=vertical<CR>')
vim.keymap.set({ 'n' }, '<leader>vc', ':3ToggleTerm direction=vertical<CR>')

vim.keymap.set({ 'n' }, '<leader>fa', ':ToggleTerm direction=float<CR>')
vim.keymap.set({ 'n' }, '<leader>fb', ':2ToggleTerm direction=float<CR>')
vim.keymap.set({ 'n' }, '<leader>fc', ':3ToggleTerm direction=float<CR>')

vim.keymap.set('v', '<C-x>', function()
  require('custom').trim_cr_and_send_lines_to_terminal('visual_lines', false, { args = vim.v.count })
  require('toggleterm').exec_command('cmd=""', nil) -- just to be sure it's executed
end)

vim.keymap.set('n', '<C-x><C-x>', function()
  require('toggleterm').send_lines_to_terminal('single_line', false, { args = vim.v.count })
end)

--[[ Abbréviations
--]]

-- pour insérer des blocs de code en quarto, note il faudrait le mettre dans un filetype-plugin voir :h filetype-plugin
vim.cmd 'iabbrev py% ```{python}<CR>```<Esc>O'

vim.cmd 'iabbrev bl+ ```<CR>'
vim.cmd 'iabbrev py+ ```{python}<CR>'
vim.cmd 'iabbrev pybl+ ```{python}<CR>```<Esc>O'
vim.cmd 'iabbrev blpy+ ```<CR>```{python}<CR>'
-- vim: ts=2 sts=2 sw=2 et
