local ffi = require('ffi')
local tb = require('termbox')
tb.tb_init()
local width, height = tb.tb_width(), tb.tb_height()
p{tb=tb,width=width,height=height}



tb.tb_select_output_mode(tb.TB_OUTPUT_216)

local event = ffi.new("struct tb_event")
p{event=event}
repeat
  tb.tb_poll_event(event)
  p{
    type = event.type,
    mod = event.mod,
    key = event.key,
    ch = event.ch,
    w = event.w,
    h = event.h,
    x = event.x,
    y = event.y,
  }
until event.key == 27 and event.type == 1

tb.tb_shutdown()


