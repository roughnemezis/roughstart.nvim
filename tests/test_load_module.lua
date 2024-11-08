local say_hello = function()
  print 'hELLO'
end

say_hello()

-- trick from https://www.youtube.com/watch?v=HXABdG3xJW4&list=LL&index=3&t=177s&ab_channel=DeveloperVoices
-- :nmap <Leader>w :write<CR>:source<CR>
-- permet d'accélérer l'évaluation du code
--

local wk = require 'kickstart.plugins.which-key'

-- [[
-- donc, comme dans le init.lua, tout ce qui est dans le config_vim/lua est importable
-- pour définir notre plugin à nous on n'a même pas besoin de
-- ]]
-- print(vim.inspect(wk))

-- :echo &rtp
-- on voit que lazy à ajouté son fichier de modules au runtimepath
-- c'est là que l'on va pour importer le vrai code d'un module
-- sur le require suivant faire gd pour naviguer vers le code
local wk_plugin = require 'which-key'
-- conséquence: si on n'édite pas avec le même vim, ce sera impossible de naviguer vers le fichier du module...
--'custom.plugins.git_log.git_log'
--

local git_log = require 'custom.plugins.git_log'
local git_log_config = require 'custom.plugins.git_log.config'

print(vim.inspect(git_log))
git_log_config.config()

-- aller aussi voir https://zignar.net/2022/11/06/structuring-neovim-lua-plugins/#internal_lazy_loading
-- explique les choix possibles de structuration d'un plugin en considérant les performances (temps de laod up)
-- en particulier appeler explicitement require dans la configuration augmente le temps de chargement car l'import en lua n'est pas gratuit
-- pour l'instant on s'en fout on fait au plus simple nos petits modules ne vont pas impacter la performance
-- mais: ça explique
--     - les choix fait dans les "vrais" modules
--     - si notre module commence à grossir a pourra être une option
--     - permet de comprendre l'intérêt du lazy-loading proposé (en particulier par lazy)
