if screen.count() > 1 and screen[1].geometry.width ~= "1920" then
--   screen[1]:swap(screen[2])
end

--awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, screen[1], awful.layout.layouts[1])
--
---- Create a promptbox for each screen
--screen[1].mypromptbox = awful.widget.prompt()
---- Create an imagebox widget which will contain an icon indicating which layout we're using.
---- We need one layoutbox per screen.
--screen[1].mylayoutbox = awful.widget.layoutbox(s)
--screen[1].mylayoutbox:buttons(gears.table.join(
--                                 awful.button({ }, 1, function () awful.layout.inc( 1) end),
--                                 awful.button({ }, 3, function () awful.layout.inc(-1) end),
--                                 awful.button({ }, 4, function () awful.layout.inc( 1) end),
--                                 awful.button({ }, 5, function () awful.layout.inc(-1) end)))
---- Create a taglist widget
--screen[1].mytaglist = awful.widget.taglist(screen[1], awful.widget.taglist.filter.all, taglist_buttons)
--
---- Create a tasklist widget
--screen[1].mytasklist = awful.widget.tasklist(screen[1], awful.widget.tasklist.filter.currenttags, tasklist_buttons)
--
---- Create the wibox
--screen[1].mywibox = awful.wibar({ position = "top", screen = s })
--
---- Add widgets to the wibox
--screen[1].mywibox:setup {
--   layout = wibox.layout.align.horizontal,
--   { -- Left widgets
--      layout = wibox.layout.fixed.horizontal,
--      mylauncher,
--      screen[1].mytaglist,
--      screen[1].mypromptbox,
--   },
--   screen[1].mytasklist, -- Middle widget
--   { -- Right widgets
--      layout = wibox.layout.fixed.horizontal,
--      mykeyboardlayout,
--      wibox.widget.systray(),
--      mytextclock,
--      screen[1].mylayoutbox,
--   },
--}

--awful.screen.connect_for_each_screen(function(s)
--    -- Wallpaper
--
--    -- Each screen has its own tag table.
--    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
--
--    -- Create a promptbox for each screen
--    s.mypromptbox = awful.widget.prompt()
--    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
--    -- We need one layoutbox per screen.
--    s.mylayoutbox = awful.widget.layoutbox(s)
--    s.mylayoutbox:buttons(gears.table.join(
--                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
--                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
--                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
--                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
--    -- Create a taglist widget
--    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)
--
--    -- Create a tasklist widget
--    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)
--
--    -- Create the wibox
--    s.mywibox = awful.wibar({ position = "top", screen = s })
--
--    -- Add widgets to the wibox
--    s.mywibox:setup {
--        layout = wibox.layout.align.horizontal,
--        { -- Left widgets
--            layout = wibox.layout.fixed.horizontal,
--            mylauncher,
--            s.mytaglist,
--            s.mypromptbox,
--        },
--        s.mytasklist, -- Middle widget
--        { -- Right widgets
--            layout = wibox.layout.fixed.horizontal,
--            mykeyboardlayout,
--            wibox.widget.systray(),
--            mytextclock,
--            s.mylayoutbox,
--        },
--    }
--end)

