local lain = require('lain')
-- Shotcuts
local horizontal = wibox.layout.align.horizontal
local fhorizontal = wibox.layout.fixed.horizontal
local separators = lain.util.separators
local larrow     = separators.arrow_left
local rarrow     = separators.arrow_right
local bg         = wibox.container.background
local margin     = wibox.container.margin
local widget     = wibox.widget

local my_widgets = require('widgets')
local widgets  = {
  layout = fhorizontal,
}

local color1 = func.fill_colors {
   max = #my_widgets+3,
   theme.hotkeys_modifiers_fg,
   theme.bg_normal,
}

local counter
if math.fmod(#my_widgets, 2) == 0 then
  counter = 0
else
  counter = 1
end

for k, v in pairs(my_widgets) do
  counter = counter + 1
  if counter > 1 then
    table.insert(widgets,
      larrow(color1[counter+2], color1[counter+1])
    )
  end
  table.insert(widgets,
    bg( margin( widget { v, layout = horizontal }, 4, 4), color1[counter+1])
  )
end

function screen_fullhd(s)
  awful.tag({ "", "", "", "", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

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

 table.insert(widgets, bg( margin( widget { s.mylayoutbox, layout = horizontal }, 4, 0), color1[1]))

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
    widgets,      -- Right widgets
  }
end
