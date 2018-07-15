local lain = require("lain")
local markup = lain.util.markup

local widget = function(timeout)
  local out = lain.widget.pulse {
    timeout = timeout,
    settings = function()
      local vlevel = volume_now.left .. "%"
      if volume_now.muted == "yes" then
        vlevel = vlevel .. " M"
      end
      widget:set_markup(
        markup.fontfg(theme.font_awesome, theme.fg_normal, "🎧").." "..vlevel
      )
    end
  }

  out.widget:buttons(awful.util.table.join(
    awful.button({}, 1, function() -- left click
      awful.spawn("pavucontrol")
    end),
    awful.button({}, 2, function() -- middle click
      awful.spawn(string.format("pactl set-sink-volume %d 100%%", out.device))
      out.update()
    end),
    awful.button({}, 3, function() -- right click
      awful.spawn(string.format("pactl set-sink-mute %d toggle", out.device))
      out.update()
    end),
    awful.button({}, 4, function() -- scroll up
      awful.spawn(string.format("pactl set-sink-volume %d +5%%", out.device))
      out.update()
    end),
    awful.button({}, 5, function() -- scroll down
      awful.spawn(string.format("pactl set-sink-volume %d -5%%", out.device))
      out.update()
    end)
  ))
  return out
end
return widget
