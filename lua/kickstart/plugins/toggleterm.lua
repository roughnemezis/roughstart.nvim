--[[
Usage

ToggleTerm size=100 direction=vertical name=desktop
ToggleTerm size=10 direction=horizontal name=desktop
ToggleTerm size=100 direction=float name=desktop

chaque appel de Toggleterm "toggle" le même terminal (que l'on peut afficher selon le 
layout souhaité (horizontal, vertical, float)


--]]

return {
  -- dir = '~/Projets/lua_plugins/plugins/toggleterm.nvim', -- notre fork (on a besoin de customiser l'envoi au REPL)
  'akinsho/toggleterm.nvim',
  opts = {
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<c-\>]],
  },
  version = '*',
  config = true,
}
