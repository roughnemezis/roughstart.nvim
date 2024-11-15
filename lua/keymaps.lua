-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 's', '<Nop>', { silent = true })
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Sortir du mode insertion
vim.keymap.set({ 'i' }, '<c-c>', '<nop>')
vim.keymap.set({ 'i', 'v' }, 'jk', '<esc>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

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

-- ******************* plugins *******************************

-- ##############      OIL             ##########################
vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' })




-- ##############      tmux sender             ##########################
local tmux_sender = require('custom.plugins.tmux-sender')
vim.api.nvim_create_user_command('TmuxSendLine', tmux_sender.send_current_line_to_tmux, {})
vim.api.nvim_create_user_command('TmuxSendSelection', tmux_sender.send_visual_selection_to_tmux, { range = true })

vim.keymap.set({ 'n' }, '<C-x><C-x>', ":TmuxSendLine<CR>j",
  { desc = 'Execute current line in tmux pane and move to next' })
vim.keymap.set({ 'n' }, '<C-c><C-c>', ":TmuxSendLine<CR>", { desc = 'Execute current line in tmux pane' })
vim.keymap.set({ 'v' }, '<C-x>', ":TmuxSendSelection<CR>`>", { desc = 'Execute current visual selection in tmux pane' })
vim.keymap.set({ 'i' }, '<C-x>', "<esc>:TmuxSendLine<CR>o",
  { desc = 'Execute current line in insert mode and goto new line' })
vim.keymap.set({ 'i' }, '<C-c>', "<esc>:TmuxSendLine<CR>a", { desc = 'Execute current line in insert mode' })

vim.keymap.set({ 'n' }, '<C-x><C-f>',
  ":silent !tmux send-keys -t 1.2 'ipython %:p' Enter<CR>",
  { desc = 'Execute current file in tmux pane and move to next' })


-- vim: ts=2 sts=2 sw=2 et
