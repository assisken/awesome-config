beautiful.notification_bg = theme.bg_normal
beautiful.notification_width     = 400
beautiful.notification_border_width = 1
beautiful.notification_border_color = theme.hotkeys_modifiers_fg
--beautiful.notification_height    = 
beautiful.notification_icon_size = 32

-- notify-send -a DISCORD -i ~/yandexdisk/Pictures/S_smiig.png Test test -u critical
naughty.notify { text = "test"}
local test = #naughty.notifications
if test then
   func.notify(test)
else
   func.notify("no")
end
