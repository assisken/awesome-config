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

-- {{{ Helper functions
local function client_menu_toggle_fn()
    local instance = nil

    return function ()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 250 } })
        end
    end
end
-- }}}


-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
   awful.button({ }, 1, function(t) t:view_only() end),
   awful.button({ modkey }, 1, function(t)
         if client.focus then
            client.focus:move_to_tag(t)
         end
   end),
   awful.button({ }, 3, awful.tag.viewtoggle),
   awful.button({ modkey }, 3, function(t)
         if client.focus then
            client.focus:toggle_tag(t)
         end
   end),
   awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
   awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
   awful.button({ }, 1, function (c)
         if c == client.focus then
            c.minimized = true
         else
            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() and c.first_tag then
               c.first_tag:view_only()
            end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
            c:raise()
         end
   end),
   awful.button({ }, 3, client_menu_toggle_fn()),
   awful.button({ }, 4, function ()
         awful.client.focus.byidx(1)
   end),
   awful.button({ }, 5, function ()
         awful.client.focus.byidx(-1)
end))

-- Each screen
local color1 = func.fill_colors {
   max = 10,
   theme.hotkeys_modifiers_fg,
   theme.bg_normal,
}

-- Screen 1 {{{
awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, screen[1], awful.layout.layouts[1])

-- Create a promptbox for each screen
screen[1].mypromptbox = awful.widget.prompt()
-- Create an imagebox widget which will contain an icon indicating which layout we're using.
-- We need one layoutbox per screen.
screen[1].mylayoutbox = awful.widget.layoutbox(screen[1])
screen[1].mylayoutbox:buttons(gears.table.join(
                                 awful.button({ }, 1, function () awful.layout.inc( 1) end),
                                 awful.button({ }, 3, function () awful.layout.inc(-1) end),
                                 awful.button({ }, 4, function () awful.layout.inc( 1) end),
                                 awful.button({ }, 5, function () awful.layout.inc(-1) end)))
-- Create a taglist widget
screen[1].mytaglist = awful.widget.taglist(screen[1], awful.widget.taglist.filter.all, taglist_buttons)

-- Create a tasklist widget
screen[1].mytasklist = awful.widget.tasklist(screen[1], awful.widget.tasklist.filter.currenttags, tasklist_buttons)

-- Create the wibox
screen[1].mywibox = awful.wibar({ position = "top", screen = screen[1] })

-- Add widgets to the wibox
screen[1].mywibox:setup
{
   layout = wibox.layout.align.horizontal,
   { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      mylauncher,
      screen[1].mytaglist,
      screen[1].mypromptbox,
   },
   screen[1].mytasklist, -- Middle widget
   { -- Right widgets
      layout = fhorizontal,
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
      bg( margin( widget { screen[1].mylayoutbox, layout = horizontal }, 4, 0), color1[1]),
   },
}
-- }}}

-- Screen 2 {{{
if screen.count() > 1 then
   awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, screen[2], awful.layout.layouts[1])
    
    -- Create a promptbox for each screen
    screen[2].mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    screen[2].mylayoutbox = awful.widget.layoutbox(screen[2])
    screen[2].mylayoutbox:buttons(gears.table.join(
                                     awful.button({ }, 1, function () awful.layout.inc( 1) end),
                                     awful.button({ }, 3, function () awful.layout.inc(-1) end),
                                     awful.button({ }, 4, function () awful.layout.inc( 1) end),
                                     awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    screen[2].mytaglist = awful.widget.taglist(screen[2], awful.widget.taglist.filter.all, taglist_buttons)
    
    -- Create a tasklist widget
    screen[2].mytasklist = awful.widget.tasklist(screen[2], awful.widget.tasklist.filter.currenttags, tasklist_buttons)
    
    -- Create the wibox
    screen[2].mywibox = awful.wibar({ position = "top", screen = screen[2] })
    
    -- Add widgets to the wibox
    screen[2].mywibox:setup
    {
       layout = wibox.layout.align.horizontal,
       { -- Left widgets
          layout = wibox.layout.fixed.horizontal,
          mylauncher,
          screen[2].mytaglist,
          screen[2].mypromptbox,
       },
       screen[2].mytasklist, -- Middle widget
       { -- Right widgets
          layout = fhorizontal,
          bg( margin( widget { mykeyboardlayout, layout = horizontal }, 4, 4), color1[2]),
          bg( margin( widget { mytextclock, layout = horizontal }, 4, 0), color1[4]),
          bg( margin( widget { screen[1].mylayoutbox, layout = horizontal }, 4, 0), color1[4]),
       },
    }
end
-- }}}

-- Screen 2
--if screen.count() > 1 then
--   local color2 = func.fill_colors {
--      max = 8,
--      theme.hotkeys_modifiers_fg,
--      theme.bg_normal,
--   }
--   screen[2].box = awful.wibar({ position = "bottom", screen = screen[2] })
--   screen[2].box:setup
--   {
--      layout = horizontal,
--      { -- Left
--         layout = fhorizontal,
--},
--      nil,
--      { -- Right
--         layout = fhorizontal,
--      }
--   }
--end
