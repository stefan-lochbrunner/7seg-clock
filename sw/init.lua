tmr.alarm(0,1000,1, function()
  if(wifi.sta.getip() == nil) then
    print('waiting')
  else
    tmr.stop(0)
    print('starting clock.lua')
    dofile("clock.lua");
  end
end)
