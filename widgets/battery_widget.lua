local lain = require('lain')

widget = function(timeout)
  local battery_widget = lain.widget.bat {
    timeout = timeout,
    settings = function()
      if bat_now.status ~= "N/A" then
        widget:set_markup(
          "BAT ["..
          lain.util.markup.fontfg(theme.font, func.rev_color(bat_now.perc), func.pipe(bat_now.perc))..
          "]"
        )
      end
    end
  }
end

return widget
