local maps = {}
function maps.load()
    maps.map = {}

    maps.map.grid = {}
    maps.map.grid.visible = true
    maps.map.grid[1] = {
        {9, 9, 27, 3, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 22, 23, 7, 7, 2, 2},
        {25, 26, 27, 27, 3, 3, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 11, 11, 11, 2, 2, 2},
        {3, 3, 3, 8, 19, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 10, 10, 10, 2, 2, 7},
        {1, 1, 1, 9, 19, 12, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 22, 23, 2, 7, 2, 2},
        {1, 1, 1, 1, 19, 12, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 22, 23, 2, 2, 7, 7},
        {1, 1, 1, 1, 19, 12, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 9, 9, 1, 1, 1, 1, 22, 23, 2, 7, 2, 2},
        {1, 1, 1, 1, 19, 12, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 8, 8, 9, 1, 1, 1, 22, 23, 2, 2, 7, 2},
        {1, 1, 9, 1, 19, 12, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 25, 26, 1, 1, 1, 22, 23, 2, 2, 7, 2},
        {3, 3, 8, 3, 19, 12, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 4, 11, 11, 11, 11, 11, 11, 22, 23, 7, 2, 2, 7},
        {3, 3, 3, 8, 19, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 19, 20, 10, 10, 10, 10, 10, 22, 23, 2, 2, 7, 2},
        {8, 3, 3, 3, 19, 12, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 19, 12, 1, 1, 1, 1, 1, 22, 23, 2, 2, 2, 2},
        {
            11,
            4,
            11,
            11,
            15,
            15,
            11,
            11,
            11,
            11,
            4,
            11,
            11,
            11,
            11,
            11,
            11,
            11,
            11,
            15,
            15,
            11,
            4,
            11,
            11,
            11,
            11,
            11,
            2,
            7,
            2,
            2
        },
        {
            10,
            10,
            10,
            10,
            4,
            10,
            10,
            10,
            10,
            10,
            10,
            10,
            10,
            10,
            10,
            4,
            10,
            10,
            10,
            10,
            10,
            10,
            10,
            10,
            10,
            10,
            10,
            10,
            2,
            2,
            2,
            2
        },
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 22, 23, 7, 2, 2, 2},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 22, 23, 2, 2, 2, 2},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 22, 23, 2, 7, 2, 2},
        {1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 22, 23, 7, 2, 7, 2},
        {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 22, 23, 2, 2, 7, 7},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 22, 23, 2, 7, 2, 2},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 22, 23, 2, 2, 2, 7},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 22, 23, 2, 2, 7, 2},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 11, 11, 11, 2, 7, 2},
        {1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 7, 2, 2},
        {9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 22, 23, 2, 2, 2, 7}
    }

    maps.map.grid[2] = {
        {13, 14, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {17, 18, 21, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 21, 0, 0, 21, 6, 21, 6, 13, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 21, 0, 0, 21, 6, 21, 6, 13, 14, 0, 0, 0, 0, 0, 0, 0, 0, 13, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 21, 0, 0, 21, 6, 21, 6, 17, 18, 0, 0, 0, 0, 0, 0, 0, 0, 17, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 21, 0, 0, 21, 6, 21, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 21, 0, 21, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 13, 14, 6, 13, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 17, 18, 6, 17, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 17, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 13, 14, 6, 13, 14, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 17, 18, 6, 17, 18, 0, 0, 0, 21, 21, 0, 0, 0, 0, 0, 13, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 6, 0, 0, 0, 0, 0, 17, 18, 13, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 21, 21, 21, 21, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 21, 6, 6, 6, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 21, 21, 21, 21, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 14, 14, 13, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 18, 18, 17, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    }

    maps.map.grid[3] = {
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    }

    maps.map.grid[4] = {
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    }

    maps.map.MAPW = 32
    maps.map.MAPH = 24
    maps.map.TILEW = 32
    maps.map.TILEH = 32

    maps.TileSheet = nil
    maps.TileTexture = {}
    maps.TileTypes = {}

    maps.TileSheet = love.graphics.newImage("images/MAPS.png")
    maps.nbColumns = maps.TileSheet:getWidth() / maps.map.TILEW
    maps.nbLines = maps.TileSheet:getHeight() / maps.map.TILEH

    local layer
    local l, c
    local id = 1
    maps.TileTexture[0] = nil
    for l = 1, maps.nbLines do
        for c = 1, maps.nbColumns do
            maps.TileTexture[id] =
                love.graphics.newQuad(
                (c - 1) * maps.map.TILEW,
                (l - 1) * maps.map.TILEH,
                maps.map.TILEW,
                maps.map.TILEH,
                maps.TileSheet:getWidth(),
                maps.TileSheet:getHeight()
            )
            id = id + 1
            maps.TileTexture.visible = true
        end
    end

    maps.TileTypes[1] = "dirt"
    maps.TileTypes[2] = "pavementVert"
    maps.TileTypes[3] = "pavementHor"
    maps.TileTypes[4] = "roadHole"
    maps.TileTypes[5] = "trenchHor"
    maps.TileTypes[6] = "grass"
    maps.TileTypes[7] = "pavementVertHole"
    maps.TileTypes[8] = "pavementHortHole"
    maps.TileTypes[9] = "dirtHole"
    maps.TileTypes[10] = "roadPvtHorDown"
    maps.TileTypes[11] = "roadPvtHorUp"
    maps.TileTypes[12] = "roadPvtVertRight"
    maps.TileTypes[13] = "buildingTopLeft"
    maps.TileTypes[14] = "buildingTopRight"
    maps.TileTypes[15] = "roadHorDown"
    maps.TileTypes[16] = "roadHorUp"
    maps.TileTypes[17] = "buildingLowLeft"
    maps.TileTypes[18] = "buildingLowRight"
    maps.TileTypes[19] = "roadPvtVertLeft"
    maps.TileTypes[20] = "roadVertLeft"
    maps.TileTypes[21] = "buildingSmall"
    maps.TileTypes[22] = "trenchVertLeft"
    maps.TileTypes[23] = "trenchVertRight"
    maps.TileTypes[24] = "roadVertRight"
    maps.TileTypes[25] = "ruinLeft"
    maps.TileTypes[26] = "ruinRight"
    maps.TileTypes[27] = "ruinSmall"
end
function maps.update(dt)
end

function maps.draw()
    local layer
    local c, l
    for layer = 1, #maps.map.grid do
        for l = 1, maps.map.MAPH do
            for c = 1, maps.map.MAPW do
                local id = maps.map.grid[layer][l][c]
                local texQuad = maps.TileTexture[id]

                if texQuad ~= nil then
                    local i
                    for i = #ListSprites, 1, -1 do
                        sprite = ListSprites[i]
                        if
                            sprite.visible and sprite.type == "heros" or sprite.type == "round" or
                                sprite.type == "round1" or
                                sprite.type == "round2" or
                                sprite.type == "shell" or
                                sprite.type == "mob" or
                                sprite.type == "boss"
                         then
                            sprite.col = math.floor(sprite.x / myMaps.map.TILEW) + 1
                            sprite.line = math.floor(sprite.y / myMaps.map.TILEH) + 1
                            if c == sprite.col and l == sprite.line and layer == 2 then
                                if id ~= 25 and id ~= 26 and id ~= 27 and id ~= 28 and id ~= 6 then
                                    if id == 13 then
                                        maps.map.grid[layer][l][c] = 28
                                    elseif id == 14 then
                                        maps.map.grid[layer][l][c] = 28
                                    elseif id == 17 then
                                        maps.map.grid[layer][l][c] = 25
                                    elseif id == 18 then
                                        maps.map.grid[layer][l][c] = 26
                                    elseif id == 21 then
                                        maps.map.grid[layer][l][c] = 27
                                    end
                                    DemolishedSound:play()
                                    createSmokeExp(
                                        (c - 1) * maps.map.TILEW,
                                        (l - 1) * maps.map.TILEH,
                                        maps.map.TILEW / 2,
                                        maps.map.TILEH / 2
                                    )
                                    createSmoke(
                                        (c - 1) * maps.map.TILEW,
                                        (l - 2) * maps.map.TILEH,
                                        maps.map.TILEW / 2,
                                        maps.map.TILEH / 2
                                    )
                                    if
                                        sprite.type == "round" or sprite.type == "round1" or sprite.type == "round2" or
                                            sprite.type == "shell"
                                     then
                                        sprite.v = 0
                                        sprite.visible = false
                                        sprite.suppr = true
                                        DemolishedSound:play()
                                        createExplosion(
                                            (c - 1) * maps.map.TILEW,
                                            (l - 1) * maps.map.TILEH,
                                            maps.map.TILEW / 2,
                                            maps.map.TILEH / 2,
                                            sprite.angle
                                        )
                                    end
                                end
                            end
                        end
                    end

                    love.graphics.draw(maps.TileSheet, texQuad, (c - 1) * maps.map.TILEW, (l - 1) * maps.map.TILEH)
                    love.graphics.setColor(love.math.colorFromBytes(1, 1, 1))
                    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
                end
                if layer == 2 then
                    local i
                    for i, sprite in ipairs(ListSprites) do
                        if
                            sprite.visible and sprite.type == "shell" or sprite.type == "round" or
                                sprite.type == "round1" or
                                sprite.type == "round2"
                         then
                            local frame = sprite.images[math.floor(sprite.currentFrame)]
                            love.graphics.draw(frame, sprite.x, sprite.y, sprite.angle, 1, 1, sprite.ox, sprite.oy)
                        elseif sprite.type == "heros" then
                            sprite.col = math.floor(sprite.x / myMaps.map.TILEW) + 1
                            sprite.line = math.floor(sprite.y / myMaps.map.TILEH) + 1
                            if c == sprite.col and l == sprite.line then
                                if id == 13 or id == 14 or id == 17 or id == 18 or id == 21 then
                                    id = 27
                                end
                            end
                        end
                    end
                end
                -- Layer 3 deals with mouving objects
                if layer == 3 then
                    local i
                    for i, sprite in ipairs(ListSprites) do
                        if
                            sprite.visible and sprite.type == "heros" or sprite.type == "gun" or sprite.type == "boss" or
                                sprite.type == "gun1" or
                                sprite.type == "gun2" or
                                sprite.type == "mob"
                         then
                            local frame = sprite.images[math.floor(sprite.currentFrame)]
                            love.graphics.draw(frame, sprite.x, sprite.y, sprite.angle, 1, 1, sprite.ox, sprite.oy)

                            --DEBUG

                            if love.keyboard.isDown("t") then
                                sprite.col = math.floor(sprite.x / myMaps.map.TILEW) + 1
                                sprite.line = math.floor(sprite.y / myMaps.map.TILEH) + 1
                                local idzones = maps.map.grid[2][sprite.line][sprite.col]
                                love.graphics.print(
                                    sprite.col .. " / " .. sprite.line .. " / " .. idzones .. " / " .. Heros.v,
                                    sprite.x + 40,
                                    sprite.y
                                )
                            end
                        end

                        -- affichage des barres de vies

                        if sprite.type == "mob" or sprite.type == "heros" then
                            love.graphics.setColor(love.math.colorFromBytes(1, 1, 1))
                            love.graphics.rectangle(
                                "fill",
                                sprite.x - sprite.w / 2 - 1,
                                sprite.y - 41,
                                sprite.maxlife * 0.6 + 2,
                                7
                            )
                            love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
                            if sprite.life > 0.5 * sprite.maxlife then
                                love.graphics.setColor(love.math.colorFromBytes(41, 148, 56))
                                love.graphics.rectangle(
                                    "fill",
                                    sprite.x - sprite.w / 2,
                                    sprite.y - 40,
                                    sprite.life * 0.6,
                                    5
                                )
                                love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
                            elseif sprite.life <= 0.5 * sprite.maxlife and sprite.life > 0.25 * sprite.maxlife then
                                love.graphics.setColor(love.math.colorFromBytes(214, 132, 15))
                                love.graphics.rectangle(
                                    "fill",
                                    sprite.x - sprite.w / 2,
                                    sprite.y - 40,
                                    sprite.life * 0.6,
                                    5
                                )
                                love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
                            else
                                love.graphics.setColor(love.math.colorFromBytes(255, 5, 27))
                                love.graphics.rectangle(
                                    "fill",
                                    sprite.x - sprite.w / 2,
                                    sprite.y - 40,
                                    sprite.life * 0.6,
                                    5
                                )
                                love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
                            end
                        end

                        -- barre de vie du boss
                        if sprite.type == "boss" then
                            if sprite.visible then
                                love.graphics.setColor(love.math.colorFromBytes(1, 1, 1))
                                love.graphics.rectangle("line", screenW / 2 - 201, 19, 402 + 2, 22)
                                love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
                                if sprite.life > 0.5 * sprite.maxlife then
                                    love.graphics.setColor(love.math.colorFromBytes(41, 148, 56))
                                    love.graphics.rectangle(
                                        "fill",
                                        screenW / 2 - 200,
                                        20,
                                        sprite.life * 402 / sprite.maxlife,
                                        20
                                    )
                                    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
                                elseif sprite.life <= 0.5 * sprite.maxlife and sprite.life > 0.25 * sprite.maxlife then
                                    love.graphics.setColor(love.math.colorFromBytes(214, 132, 15))
                                    love.graphics.rectangle(
                                        "fill",
                                        screenW / 2 - 200,
                                        20,
                                        sprite.life * 402 / sprite.maxlife,
                                        20
                                    )
                                    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
                                else
                                    love.graphics.setColor(love.math.colorFromBytes(255, 5, 27))
                                    love.graphics.rectangle(
                                        "fill",
                                        screenW / 2 - 200,
                                        20,
                                        sprite.life * 402 / sprite.maxlife,
                                        20
                                    )
                                    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    local x = love.mouse.getX()
    local y = love.mouse.getY()

    maps.col = math.floor(x / maps.map.TILEW) + 1
    maps.lin = math.floor(y / maps.map.TILEH) + 1

    -- if maps.col > 0 and maps.col <= maps.map.MAPW and maps.lin > 0 and maps.lin <= maps.map.MAPH then
    --     local idzones = maps.map.grid[2][maps.lin][maps.col]
    --     love.graphics.setColor(love.math.colorFromBytes(1, 1, 1))
    --     love.graphics.print("Type : " .. tostring(maps.TileTypes[idzones]) .. "(" .. tostring(idzones) .. ")", 0, 60)
    --     love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
    -- else
    --     love.graphics.setColor(love.math.colorFromBytes(1, 1, 1))
    --     --love.graphics.print("hors du tableau", 0, 0)
    --     love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
    -- end
end

return maps
