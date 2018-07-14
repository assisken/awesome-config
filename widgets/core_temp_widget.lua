local lain = require('lain')

widget = function(timeout)
  return lain.widget.temp {
    timeout = timeout,
    settings = function()
      widget:set_markup(lain.util.markup.font(theme.font_awesome, "")..
        lain.util.markup.font(theme.font, "  "..coretemp_now.."°C "))
    end
  }
end

return widget
