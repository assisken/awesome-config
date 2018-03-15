local w = {}
local markup = lain.util.markup

w.cpu = lain.widget.cpu {
   timeout = 2,
   settings = function()
      widget:set_markup(
         "CPU ["..
            markup.fontfg(theme.font, func.color(cpu_now.usage), func.pipe(cpu_now.usage))..
            "] "
      )
   end
}

w.mem = lain.widget.mem {
   timeout = 2,
   settings = function()
      widget:set_markup(
         "MEM ["..
            markup.fontfg(theme.font, func.color(mem_now.perc), func.pipe(mem_now.perc))..
            "] "
      )
   end
}

w.net = lain.widget.net {
   timeout = 2,
   iface = "enp0s6",
   settings = function()
      widget:set_markup(
         "NET in-["..
            markup.fontfg(theme.font, func.color(net_now.received/100), func.pipe(net_now.received/100))..
            "] out-\n["..
            markup.fontfg(theme.font, func.color(net_now.sent/100), func.pipe(net_now.sent/100))..
            "] "
      )
   end
}

w.pulse = lain.widget.pulse {
   timeout = 2,
   settings = function()
      local vlevel = volume_now.left .. "%"
      if volume_now.muted == "yes" then
            vlevel = vlevel .. " M"
      end
      widget:set_markup(
         markup.fontfg(theme.font_awesome, theme.fg_normal, "")..
            "  "..vlevel
      )
   end
}
w.pulse.widget:buttons(awful.util.table.join(
    awful.button({}, 1, function() -- left click
        awful.spawn("pavucontrol")
    end),
    awful.button({}, 2, function() -- middle click
        awful.spawn(string.format("pactl set-sink-volume %d 100%%", w.pulse.device))
        w.pulse.update()
    end),
    awful.button({}, 3, function() -- right click
        awful.spawn(string.format("pactl set-sink-mute %d toggle", w.pulse.device))
        w.pulse.update()
    end),
    awful.button({}, 4, function() -- scroll up
        awful.spawn(string.format("pactl set-sink-volume %d +5%%", w.pulse.device))
        w.pulse.update()
    end),
    awful.button({}, 5, function() -- scroll down
        awful.spawn(string.format("pactl set-sink-volume %d -5%%", w.pulse.device))
        w.pulse.update()
    end)
))

-- Coretemp (lain, average)
w.temp = lain.widget.temp {
   timeout = 2,
   settings = function()
      widget:set_markup(markup.font(theme.font_awesome, "")..
                           markup.font(theme.font, "  "..coretemp_now.."°C "))
   end
}

w.fs_root = lain.widget.fs {
   timeout = 2,
   options  = "--exclude-type=tmpfs",
   partition = "/",
   notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = theme.monospace },
   settings = function()
      widget:set_markup(markup.font(theme.font, "/ "..fs_now.available_gb.." GB "))
   end
}

w.fs_home = lain.widget.fs {
   timeout = 2,
   options  = "--exclude-type=tmpfs",
   partition = "/home",
   notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = theme.monospace },
   settings = function()
      widget:set_markup(markup.font(theme.font, "/home "..fs_now.available_gb.." GB "))
   end
}

-- Battery
w.bat = lain.widget.bat {
   timeout = 2,
   settings = function()
      if bat_now.status ~= "N/A" then
         widget:set_markup(
            "BAT ["..
               markup.fontfg(theme.font, func.rev_color(bat_now.perc), func.pipe(bat_now.perc))..
               "]"
         )
      end
   end
}

return w
