--[[
    we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

--]]

local home = vim.env.HOME
vim.g.python_host_prog = home .. '/slash/apps/python_venvs/neovim/bin/python'
vim.g.python3_host_prog = home .. '/slash/apps/python_venvs/neovim3/bin/python'

local node_bin = '/.nvm/versions/node/v21.6.2/bin'
-- vim.g.node_host_prog = home .. node_bin .. "/node"
vim.cmd("let $PATH = '" .. home .. node_bin .. ":' . $PATH")

vim.g.mapleader = ','
vim.g.maplocalleader = '%'

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
