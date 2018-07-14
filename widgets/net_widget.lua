local watch = require("awful.widget.watch")

local iface = ''
local status_update = "cat /sys/class/net/"..iface.."/operstate"


local label = 'NET'
local height = 20
local width  = 50
local bar_height = 3
local timeout = 2

local rect = function(cr, width, height)
  local shape = gears.shape
  shape.rectangle(cr, width, bar_height)
end

local progressbar = wibox.widget {
  {
    max_value     = 1,
    value         = 0,
    forced_height = height,
    forced_width  = width,
    border_width  = 0,
    paddings      = 0,
    border_color  = beautiful.border_color,
    widget        = wibox.widget.progressbar,
    background_color 	= 'alpha',
    shape         = rect,
    color         = {
       type="linear",
       from = {0, 0},
       to = {width, 0},
       stops = {
        {0, "#008844"},
        {0.5, "#ffff00"},
        {1, "#ff0000"}
      },
    },
  },
  layout = wibox.container.mirror(mem_progressbar, { vertical = true }),
}

local text = wibox.widget {
  text   = label,
  align  = 'center',
  widget = wibox.widget.textbox,
}

widget = function(timeout)
  local out =  wibox.widget {
    text,
    progressbar,
    layout        = wibox.layout.stack,
  }

  watch(status_update, 1,
    function(widget, stdout, stderr, exitreason, exitcode)
      text.text = stdout
    end,
    out
  )
  return out
end

return widget
