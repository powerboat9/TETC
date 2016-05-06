local tArgs = {...}
local gps1 = vector.new(tArgs[1], tArgs[2], tArgs[3])
local gps2 = vector.new(tArgs[4], tArgs[5], tArgs[6])
local gps3 = vector.new(tArgs[7], tArgs[8], tArgs[9])
local gps4 = vector.new(tArgs[10], tArgs[11], tArgs[12])

local function toDegrees(angle)
    --Do This

local function fromDegrees(x, y)
    local newVect = vector.new(math.sin(x), math.cos(y), 0)

local function rotate(point, object, shift)
    local xDegrees, yDegrees = toDegrees((object - point):normalize())
    local appendX, appendY = toDegrees(shift)
    xDegrees = (xDegrees + appendX) % 360
    yDegrees = (yDegrees + appendY) % 360
    return (object - point):length() * fromDegrees(xDegrees, yDegrees)
end

function trilaterate(v1, d1, v2, d2, v3, d3, v4, d4)
    if not (v1 and d1 and v2 and d2 and v3 and d3 and v4 and d4) then
        return false, 1
    end
    local cRadus, cPos, cAngle = false, false, false
    do
        local v1_2 = v2 - v1
        cAngle = v1_2:normalize()
        local v1_2_len = v1_2:length()
        local D2 = 180 * d2 / (d1 + d2 + v1_2_len)
        cRadius = math.sin(D2)
        cPos = (cAngle * math.cos(D2)) + v1
    end
    while true do
        local dunSwaped = false
        local subVec = (cPos - v3):normalize() - cAngle
        if (math.abs(subVec.x) + math.abs(subVec.y) + math.abs(subVec.z)) >= 15 then
            break
        elseif not dunSwaped then
            v3, v4 = v4, v3 --Found out you could do this while online
            dunSwaped = true
        else
            return false, 2
        end
    end
    local checkP1, checkP2 = false, false
    do --Step 2: The hardest part
        local localGrid = {cPos = vector.new(0, 0, 0), v3 = v3 - cPos}
        --TODO: FINISH
    end
    local isP1 = (v4 - checkP1):length() == d4
    local isP2 = (v4 - checkP2):length() == d4
    if isP1 and isP2 then
        return false, 4
end
    
