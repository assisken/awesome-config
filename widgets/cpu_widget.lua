local watch = require("awful.widget.watch")

local label = 'CPU'
local height = 20
local width  = 50
local bar_height = 3

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
  layout = wibox.container.mirror(cpu_progressbar, { vertical = true }),
}

local text = wibox.widget {
  text   = label,
  align  = 'center',
  widget = wibox.widget.textbox,
}

local widget = function(timeout)
  local out =  wibox.widget {
    text,
    progressbar,

    layout        = wibox.layout.stack,
  }

  local total_prev = 0
  local idle_prev = 0

  watch('cat /proc/stat | grep "^cpu"', timeout,
    function(widget, stdout, stderr, exitreason, exitcode)
      user, nice, system, idle, iowait, irq, softirq, steal, guest, guest_nice =
          stdout:match('(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s')

      local total = user + nice + system + idle + iowait + irq + softirq + steal

      local diff_idle = idle - idle_prev
      local diff_total = total - total_prev
      local diff_usage = (1000 * (diff_total - diff_idle) / diff_total + 5) / 10

      progressbar.widget.value = diff_usage / 100

      total_prev = total
      idle_prev = idle
    end,
    widget
  )
  return out
end
return widget
