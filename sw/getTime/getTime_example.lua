--include 'library'
require('getTime')

--time in GMT
getTime()
print(time)

--DST in GMT+1
getTime(1,1)
print(time)

--full date in DST & GMT+1
--also prints full date to serial from within function
getTime(1,1,1)
print(time)

--complete response from server
--printed to serial from within function
getTime(0,0,0,1)
