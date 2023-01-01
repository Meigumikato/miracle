local config = function()
  local home = os.getenv('HOME')
  local db = require('dashboard')

  db.custom_center = {
    { icon = '  ',
      desc = 'New File                                ',
      shortcut = 'SPC s n',
      action = 'DashboardNewFile' },
    { icon = '  ',
      desc = 'Recently opened files                   ',
      action = 'DashboardFindHistory',
      shortcut = 'SPC f r' },
    { icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files                  ',
      shortcut = 'SPC f f' },
    { icon = '  ',
      desc = 'File Browser                            ',
      action = 'Telescope file_browser',
      shortcut = 'SPC f d' },
    { icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f w' },
    { icon = '  ',
      desc = 'Open Personal Config                    ',
      action = 'Telescope dotfiles path=' .. home .. '/.config/nvim',
      shortcut = 'SPC f d' },
  }
end

return config
