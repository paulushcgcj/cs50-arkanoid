WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

MAIN_MENU = {
    {text = "START", state = 'play'}, {text = "HIGH SCORES", state = 'scores'},
    {text = "CREDITS", state = 'credits'}
}

PADDLES_DATA = {
    {
        {x = 0, y = 64, width = 32, height = 16},
        {x = 32, y = 64, width = 64, height = 16},
        {x = 96, y = 64, width = 96, height = 16},
        {x = 0, y = 80, width = 128, height = 16}
    }, {
        {x = 0, y = 96, width = 32, height = 16},
        {x = 32, y = 96, width = 64, height = 16},
        {x = 96, y = 96, width = 96, height = 16},
        {x = 0, y = 112, width = 128, height = 16}
    }, {
        {x = 0, y = 128, width = 32, height = 16},
        {x = 32, y = 128, width = 64, height = 16},
        {x = 96, y = 128, width = 96, height = 16},
        {x = 0, y = 144, width = 128, height = 16}
    }
}

BALLS_DATA = {
    {
        {x = 96, y = 48, width = 8, height = 8},
        {x = 104, y = 48, width = 8, height = 8},
        {x = 112, y = 48, width = 8, height = 8},
        {x = 120, y = 48, width = 8, height = 8},
        {x = 96, y = 56, width = 8, height = 8},
        {x = 104, y = 56, width = 8, height = 8},
        {x = 112, y = 56, width = 8, height = 8}
    }

}

COLLORS = {
    ['primary'] = {0.24, 0.32, 0.53, 1},
    ['secondary'] = {0.61, 0.45, 0.67, 1},
    ['clear'] = {0.78, 0.71, 0.81, 1},
    ['other'] = {1, 0.96, 0.87, 1},
    ['white'] = {1, 1, 1, 1},
    ['black'] = {0, 0, 0, 1},
    ['gametitle'] = {0.45, 1, 1, 1}
}

