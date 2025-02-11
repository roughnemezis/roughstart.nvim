-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  'nvim-lua/plenary.nvim',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-fugitive',
  require 'kickstart/plugins/toggleterm',
  require 'kickstart/plugins/nvim-surround',
  require 'kickstart/plugins/gruvbox',
  require 'kickstart/plugins/quarto',
  require 'kickstart/plugins/nvim-ufo',
  require 'kickstart/plugins/vim-tmux-navigator',
  require 'kickstart/plugins/gitsigns',
  require 'kickstart/plugins/which-key',
  require 'kickstart/plugins/telescope',
  require 'kickstart/plugins/lspconfig',
  require 'kickstart/plugins/conform',
  require 'kickstart/plugins/cmp',
  -- require 'kickstart/plugins/tokyonight',
  require 'kickstart/plugins/todo-comments',
  require 'kickstart/plugins/mini',
  require 'kickstart/plugins/treesitter',
  require 'kickstart/plugins/oil',
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',

  --la ligne suivante permet de traiter tous les fichiers de specs (lazy) de plugins avec lazy.
  -- c'est une alternative qui permet de ne pas lister explicitement tous les fichiers de specs comme au dessus
  -- ce n'est pas ce qu'on veut on va loader nos 'plugins persos' explicitement sans passer par lazy
  -- (voir plus tard si les fonctionnalités d'autoreload peuvent nous faire changer d'avis)
  -- { import = 'custom.plugins' },
}

-- vim: ts=2 sts=2 sw=2 et
