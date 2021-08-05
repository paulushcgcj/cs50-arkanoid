push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

function love.load()
    love.graphics.setDefaultFilter('nearest','nearest')
    love.window.setTitle('ArkaneDroid by Paulo')
    math.randomseed(os.time())

    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen = false,
        resizable = true,
        vsync = true,
        canvas = false
    })

    love.keyboard.keysPressed = {}

end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    love.graphics.printf('ArkaneDroid made with Love2D!', 0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, 'center')
    push:finish()
end