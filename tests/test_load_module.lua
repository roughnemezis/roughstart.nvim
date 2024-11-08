local say_hello = function()
  print 'hELLO'
end

say_hello()

-- trick from [(110) Developing a Neovim Docker Plugin from Scratch - YouTube](https://www.youtube.com/watch?v=HXABdG3xJW4&list=LL&index=3&t=177s&ab_channel=DeveloperVoices):
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

local my_plugin = require 'custom.plugins.git_log'

print(vim.inspect(my_plugin))
