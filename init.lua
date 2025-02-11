local home = vim.env.HOME
vim.g.python_host_prog = home .. '/slash/apps/python_venvs/neovim/bin/python'
vim.g.python3_host_prog = home .. '/slash/apps/python_venvs/neovim3/bin/python'

local node_bin = '/.nvm/versions/node/v21.6.2/bin'
vim.cmd("let $PATH = '" .. home .. node_bin .. ":' . $PATH")

vim.g.mapleader = ','
vim.g.maplocalleader = '%'

vim.g.have_nerd_font = true

require 'options'
require 'keymaps'
require 'lazy-bootstrap'
require 'lazy-plugins'

require 'user-plugins'

-- vim: ts=2 sts=2 sw=2 et
