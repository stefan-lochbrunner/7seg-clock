Nudemcu lua library to fetch time, based on: https://github.com/thearduinoguy/ESP8266-Lua-Code/blob/master/googleTime.lua

Basically packages original script into a function to be called when needed as opposed to being periodically called in the original project.

Since net.socket:on() doesn't return data, the data is handed over by writing it into a global variable.

See getTime_example.lua for usage examples.
