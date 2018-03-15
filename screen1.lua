local my_widget  = require("widgets")
-- Shotcuts
local horizontal = wibox.layout.align.horizontal
local fhorizontal = wibox.layout.fixed.horizontal
local separators = lain.util.separators
local larrow     = separators.arrow_left
local rarrow     = separators.arrow_right
local bg         = wibox.container.background
local margin     = wibox.container.margin
local widget     = wibox.widget
local color1 = func.fill_colors {
   max = 10,
   theme.hotkeys_modifiers_fg,
   theme.bg_normal,
}

function screen1(s)
   awful.tag({ "", "", "", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
   
   -- Create a promptbox for each screen
   s.mypromptbox = awful.widget.prompt()
   -- Create an imagebox widget which will contain an icon indicating which layout we're using.
   -- We need one layoutbox per screen.
   s.mylayoutbox = awful.widget.layoutbox(s)
   s.mylayoutbox:buttons(gears.table.join(
                                    awful.button({ }, 1, function () awful.layout.inc( 1) end),
                                    awful.button({ }, 3, function () awful.layout.inc(-1) end),
                                    awful.button({ }, 4, function () awful.layout.inc( 1) end),
                                    awful.button({ }, 5, function () awful.layout.inc(-1) end)))
   -- Create a taglist widget
   s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)
   
   -- Create a tasklist widget
   s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)
   
   -- Create the wibox
   s.mywibox = awful.wibar({ position = "top", screen = s })
   
   -- Add widgets to the wibox
   s.mywibox:setup
   {
      layout = wibox.layout.align.horizontal,
      y = 120,
      { -- Left widgets
         layout = wibox.layout.fixed.horizontal,
         mylauncher,
         s.mytaglist,
         s.mypromptbox,
      },
      s.mytasklist, -- Middle widget
      { -- Right widgets
         layout = fhorizontal,
         bg( margin( widget { my_widget.bat, layout = horizontal }, 4, 4), color1[10]),
         larrow(color1[10], color1[9]),
         bg( margin( widget { my_widget.cpu, layout = horizontal }, 4, 4), color1[9]),
         larrow(color1[9], color1[8]),
         bg( margin( widget { my_widget.mem, layout = horizontal }, 4, 4), color1[8]),
         larrow(color1[8], color1[7]),
         bg( margin( widget { my_widget.net, layout = horizontal }, 4, 4), color1[7]),
         larrow(color1[7], color1[6]),
         bg( margin( widget { my_widget.fs_root, layout = horizontal }, 4, 4), color1[6]),
         larrow(color1[6], color1[5]),
         bg( margin( widget { my_widget.fs_home, layout = horizontal }, 4, 4), color1[5]),
         larrow(color1[5], color1[4]),
         bg( margin( widget { my_widget.pulse, layout = horizontal }, 4, 4), color1[4]),
         larrow(color1[4], color1[3]),
         bg( margin( widget { mykeyboardlayout, layout = horizontal }, 4, 4), color1[3]),
         larrow(color1[3], color1[2]),
         bg( margin( widget { wibox.widget.systray(), layout = horizontal }, 4, 4), color1[2]),
         larrow(color1[2], color1[1]),
         bg( margin( widget { mytextclock, layout = horizontal }, 4, 0), color1[1]),
         bg( margin( widget { s.mylayoutbox, layout = horizontal }, 4, 0), color1[1]),
      },
   }
end
