-- function/lib to fetch current time from Google
-- result stored in global variable 'time', see examples
-- based on http://thearduinoguy.org/?p=217
time = 0

function getTime(DST, GMToffset, fullDate, debug)
  if(not GMToffset) then
    GMToffset = 0
  end

  conn=net.createConnection(net.TCP, 0)
  conn:on("connection",function(conn, payload)
              conn:send("HEAD / HTTP/1.1\r\n"..
                        "Host: google.com\r\n"..
                        "Accept: */*\r\n"..
                        "User-Agent: Mozilla/4.0 (compatible; esp8266 Lua;)"..
                        "\r\n\r\n")
              end)
  conn:on("receive", function(conn, payload)
    if(DST == 1) then
      GMToffset = GMToffset + 1
    end
    time = string.sub(payload,string.find(payload,"Date: ")+23,string.find(payload,"Date: ")+27)
    hours = tonumber(string.sub(time,1,2)) + GMToffset
    minutes = string.sub(time,4,5)
    time = hours..':'..minutes
    if(fullDate == 1) then
      time = string.sub(payload,string.find(payload,"Date: ")+6,string.find(payload,"Date: ")+22)
        ..hours..':'..minutes..':'
        ..string.sub(payload,string.find(payload,"Date: ")+29,string.find(payload,"Date: ")+35)
        ..'+'..GMToffset
      print(time)
    end
    if(debug == 1) then
      print(payload)
    end

    conn:close()
  end)
  conn:connect(80,'google.com')
end
