local function trilaterate(p1, p2, p3)
    local shift = p1[1]
    p1[1] = vector.new()
    p2[1] = p2[1] - shift
    p3[1] = p3[1] - shift
    local degRotToX = p1[1].
