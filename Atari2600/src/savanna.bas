    set kernel_options pfcolors

main
    missile0x = 75 : missile0y = 50 : missile0height = 6
    goto home_start

home
    COLUBK = $FE
    if joy0up then missile0y = missile0y - 1
    if joy0down then missile0y = missile0y + 1
    if joy0left then missile0x = missile0x - 1
    if joy0right then missile0x = missile0x + 1

    if missile0y = 90 then missile0y = 10 : goto farm_start

    pfcolors:
    $F4
    $F4
    $F4
    $F4
    $F4
    $F4
    $F4
    $F4
    $F4
    $F4
    $F4
end

    COLUP0 = $F0
    NUSIZ0 = $30

    drawscreen
    goto home

farm
    COLUBK = $C4
    if joy0up then missile0y = missile0y - 1
    if joy0down then missile0y = missile0y + 1
    if joy0left then missile0x = missile0x - 1
    if joy0right then missile0x = missile0x + 1

    x = 0
    y = 0
    a = missile0x - 8
    b = missile0y - 1

    if a < 0 then a = 0

    for i = 0 to a step 4 : x = x + 1 : next
    for i = 0 to b step 8 : y = y + 1 : next
    x = x - 2
    y = y - 1
    if joy0fire && x >= 0 && x <= 31 && y >= 0 && y <= 11 then pfpixel x y on

    if missile0y = 8 then missile0y = 88 : goto home_start

    pfcolors:
    $1E
    $82
    $1E
    $82
    $1E
    $82
    $1E
    $82
    $1E
    $82
    $1E
end

    COLUP0 = $F0
    NUSIZ0 = $30

    drawscreen
    goto farm

home_start
    playfield:
    ................................
    ................................
    ......XX..........XX............
    ....XXXXXX......XXXXXX..........
    .....XXXX........XXXX...........
    .....XXXX........XXXX...........
    .....X..X........X..X...........
    ................................
    ................................
    ................................
    ................................
end
    goto home

farm_start
    playfield:
    ................................
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    ................................
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    ................................
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    ................................
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    ................................
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    ................................
end
    goto farm
    