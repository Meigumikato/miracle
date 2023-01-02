local config = function()
  -- local home = os.getenv('HOME')
  local db = require('dashboard')

  db.custom_center = {
    { icon = '  ',
      desc = 'New File                                ',
      shortcut = 'SPC d n',
      action = 'DashboardNewFile' },
    -- { icon = '  ',
    --   desc = 'Recently opened files                   ',
    --   action = 'DashboardFindHistory',
    --   shortcut = 'SPC f r' },
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
      shortcut = 'SPC f g' },
    -- { icon = '  ',
    --   desc = 'Open Personal Config                    ',
    --   action = 'Telescope dotfiles',
    --   shortcut = 'SPC d c' },
  }
end

return config
