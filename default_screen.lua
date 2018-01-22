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

function default_screen(s)
   awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
    
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
       { -- Left widgets
          layout = wibox.layout.fixed.horizontal,
          mylauncher,
          s.mytaglist,
          s.mypromptbox,
       },
       s.mytasklist, -- Middle widget
       { -- Right widgets
          layout = fhorizontal,
          bg( margin( widget { mykeyboardlayout, layout = horizontal }, 4, 4), color1[3]),
          larrow(color1[3], color1[2]),
          bg( margin( widget { wibox.widget.systray(), layout = horizontal }, 4, 4), color1[2]),
          larrow(color1[2], color1[1]),
          bg( margin( widget { mytextclock, layout = horizontal }, 4, 0), color1[1]),
          bg( margin( widget { s.mylayoutbox, layout = horizontal }, 4, 0), color1[1]),
       },
    }
end
