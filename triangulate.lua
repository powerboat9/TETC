local dist, pos = ...

--[[
My Math:

newPos = pos[n] + change[n]
dist[n] = math.sqrt(change[n].x ^ 2 + change[n].y ^ 2 + change[n].z ^ 2)
    dist[n] ^ 2 = change[n].x ^ 2 + change[n].y ^ 2 + change[n].z ^ 2

Which leads to:

newPos = pos[n] + change[n]
    newPos = pos[1] + change[1]
    newPos = pos[2] + change[2]
    newPos = pos[3] + change[3]
    newPos = pos[4] + change[4]
dist[n] ^ 2 = change[n].x ^ 2 + change[n].y ^ 2 + change[n].z ^ 2
    dist[1] ^ 2 = change[1].x ^ 2 + change[1].y ^ 2 + change[1].z ^ 2
    dist[2] ^ 2 = change[2].x ^ 2 + change[2].y ^ 2 + change[2].z ^ 2
    dist[3] ^ 2 = change[3].x ^ 2 + change[3].y ^ 2 + change[3].z ^ 2
    dist[4] ^ 2 = change[4].x ^ 2 + change[4].y ^ 2 + change[4].z ^ 2
        math.sqrt(dist[1] ^ 2 - change[1].y ^ 2 - change[1].z ^ 2) = change[1].x
            math.sqrt(dist[1] ^ 2 - change[1].x ^ 2 - change[1].z ^ 2) = change[1].y
            math.sqrt(dist[1] ^ 2 - change[1].x ^ 2 - change[1].y ^ 2) = change[1].z
        math.sqrt(dist[2] ^ 2 - change[2].y ^ 2 - change[2].z ^ 2) = change[2].x
            math.sqrt(dist[2] ^ 2 - change[2].x ^ 2 - change[2].z ^ 2) = change[2].y
            math.sqrt(dist[2] ^ 2 - change[2].x ^ 2 - change[2].y ^ 2) = change[2].z
        math.sqrt(dist[3] ^ 2 - change[3].y ^ 2 - change[3].z ^ 2) = change[3].x
            math.sqrt(dist[3] ^ 2 - change[3].x ^ 2 - change[3].z ^ 2) = change[3].y
            math.sqrt(dist[3] ^ 2 - change[3].x ^ 2 - change[3].y ^ 2) = change[3].z
        math.sqrt(dist[4] ^ 2 - change[4].y ^ 2 - change[4].z ^ 2) = change[4].x
            math.sqrt(dist[4] ^ 2 - change[4].x ^ 2 - change[4].z ^ 2) = change[4].y
            math.sqrt(dist[4] ^ 2 - change[4].x ^ 2 - change[4].y ^ 2) = change[4].z
        
Ending Math
]]--

function createAngle(p1, p2)
    local p1To2 = p2 - p1
    return p1To2 / p1To2:length()
end

local newPos = nil
--Finds a circle which the enemy can be at the edge of
do
    local circle = {} --position, rotation (roll, pitch, yaw) and radius
    do
        local line = {pos[1], pos[2]}
        
        
