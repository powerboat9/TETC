local tArgs = {...}
local gps1 = vector.new(tArgs[1], tArgs[2], tArgs[3])
local gps2 = vector.new(tArgs[4], tArgs[5], tArgs[6])
local gps3 = vector.new(tArgs[7], tArgs[8], tArgs[9])
local gps4 = vector.new(tArgs[10], tArgs[11], tArgs[12])

function trilaterate(p1, d1, p2, d2, p3, d3, p4, d4)
    local cPoint, cDist = 1, 1
    do
        local line = p2 - p1
        local distance = d1 * ((line:length() ^ 2 + d1 ^ 2 - d2 ^ 2)/(2 * line:length() * d1))
        cPoint = line:normalize() * distance + p1
        cDist = d1 ^ 2 - distance ^ 2
    end
    
