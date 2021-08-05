require 'src/Dependencies'

function love.load()
    love.graphics.setDefaultFilter('nearest','nearest')
    love.window.setTitle('ArkaneDroid by Paulo')
    math.randomseed(os.time())

    gFonts = {
        ['small'] = love.graphics.newFont('assets/fonts/PressStart2P-Regular.ttf', 8),
        ['medium'] = love.graphics.newFont('assets/fonts/PressStart2P-Regular.ttf', 16),
        ['large'] = love.graphics.newFont('assets/fonts/PressStart2P-Regular.ttf', 32),

        ['small_secondary'] = love.graphics.newFont('assets/fonts/GamePlayed.ttf', 12),
        ['medium_secondary'] = love.graphics.newFont('assets/fonts/GamePlayed.ttf', 18),
        ['large_secondary'] = love.graphics.newFont('assets/fonts/GamePlayed.ttf', 32)
    }
    love.graphics.setFont(gFonts['small'])

    gTextures = {
        ['background'] = love.graphics.newImage('assets/graphics/background.png'),
        ['main'] = love.graphics.newImage('assets/graphics/breakout.png'),
        ['arrows'] = love.graphics.newImage('assets/graphics/arrows.png'),
        ['hearts'] = love.graphics.newImage('assets/graphics/hearts.png'),
        ['particle'] = love.graphics.newImage('assets/graphics/particle.png')
    }

    gFrames = {
        ['paddles'] = getQuad(gTextures['main'],PADDLES_DATA),
        ['balls'] = getQuad(gTextures['main'],BALLS_DATA)
    }

    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen = false,
        resizable = true,
        vsync = true,
        canvas = false
    })

    gSounds = {
        ['paddle-hit'] = love.audio.newSource('assets/sounds/paddle_hit.wav', "static"),
        ['score'] = love.audio.newSource('assets/sounds/score.wav', "static"),
        ['wall-hit'] = love.audio.newSource('assets/sounds/wall_hit.wav', "static"),
        ['confirm'] = love.audio.newSource('assets/sounds/confirm.wav', "static"),
        ['select'] = love.audio.newSource('assets/sounds/select.wav', "static"),
        ['no-select'] = love.audio.newSource('assets/sounds/no-select.wav', "static"),
        ['brick-hit-1'] = love.audio.newSource('assets/sounds/brick-hit-1.wav', "static"),
        ['brick-hit-2'] = love.audio.newSource('assets/sounds/brick-hit-2.wav', "static"),
        ['hurt'] = love.audio.newSource('assets/sounds/hurt.wav', "static"),
        ['victory'] = love.audio.newSource('assets/sounds/victory.wav', "static"),
        ['recover'] = love.audio.newSource('assets/sounds/recover.wav', "static"),
        ['high-score'] = love.audio.newSource('assets/sounds/high_score.wav', "static"),
        ['pause'] = love.audio.newSource('assets/sounds/pause.wav', "static"),

        ['music'] = love.audio.newSource('assets/sounds/music.wav', "stream")
    }

    gStateMachine = StateMachine {
        ['start'] = function() return StartState(MAIN_MENU) end,
        ['play'] = function() return PlayState() end,
        ['scores'] = function() return HighScoreState() end,
        ['credits'] = function() return CreditsState() end,
    }
    gStateMachine:change('start')

    love.keyboard.keysPressed = {}

end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()

    local backgroundWidth = gTextures['background']:getWidth()
    local backgroundHeight = gTextures['background']:getHeight()

    love.graphics.draw(
        gTextures['background'],
        0,
        0,
        0,
        VIRTUAL_WIDTH / (backgroundWidth - 1),
        VIRTUAL_HEIGHT / (backgroundHeight - 1)
    )

    gStateMachine:render()

    push:finish()
end