require('sevenSeg')
t = require('getTime')

--set parameters
DST = 1
GMToffset = 1
timeFormat = 1    --hh:mm
updatePeriod = 5000   --in ms
updateTime = nil
dispTime = nil
t.setup(DST, GMToffset, timeFormat)
t.getTime()

--display dashes to indicate time is being updated
for i=1,4 do
    sevenSeg('-')
end

--update time
tmr.alarm(0, updatePeriod, 1, function()
  --check if time has changed
  if(t.time) then
    updateTime = t.time
  end
  --update display if time changed
  if(updateTime ~= dispTime) then
    dispTime = updateTime
    temp = updateTime:sub(-5,-4)..updateTime:sub(-2,-1)
    for i=1,4 do
        sevenSeg(tonumber(temp:sub(-i,-i)))
    end
  end
  --update time
  t.getTime()
end)
