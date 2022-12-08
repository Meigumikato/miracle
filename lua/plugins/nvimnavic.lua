local M = {}

local icons = require('core.icons')
local kind = icons.kind

M.options = {
    icons = {
      File          = kind.File          .. ' ',
      Module        = kind.Module        .. ' ',
      Namespace     = kind.Namespace     .. ' ',
      Package       = kind.Package       .. ' ',
      Class         = kind.Class         .. ' ',
      Method        = kind.Method        .. ' ',
      Property      = kind.Property      .. ' ',
      Field         = kind.Field         .. ' ',
      Constructor   = kind.Constructor   .. ' ',
      Enum          = kind.Enum          .. ' ',
      Interface     = kind.Interface     .. ' ',
      Function      = kind.Function      .. ' ',
      Variable      = kind.Variable      .. ' ',
      Constant      = kind.Constant      .. ' ',
      String        = kind.String        .. ' ',
      Number        = kind.Number        .. ' ',
      Boolean       = kind.Boolean       .. ' ',
      Array         = kind.Array         .. ' ',
      Object        = kind.Object        .. ' ',
      Key           = kind.Key           .. ' ',
      Null          = kind.Null          .. ' ',
      EnumMember    = kind.EnumMember    .. ' ',
      Struct        = kind.Struct        .. ' ',
      Event         = kind.Event         .. ' ',
      Operator      = kind.Operator      .. ' ',
      TypeParameter = kind.TypeParameter .. ' ',
  },
  highlight = true,
  separator = " " .. icons.ui.ChevronRight .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true
}

function M.setup()
  require('nvim-navic').setup(M.options)
end

return M
