local lain = require('lain')

widget = function(path, timeout)
  return lain.widget.fs {
     timeout = timeout,
     options  = "--exclude-type=tmpfs",
     notification_preset = {
       fg = theme.fg_normal,
       bg = theme.bg_normal,
       font = theme.monospace
     },
     settings = function()
        widget:set_markup(
          lain.util.markup.font(
            theme.font,
            path.." ".. math.floor(fs_now[path].free) .." ".. fs_now[path].units
          )
        )
     end
  }
end

return widget
