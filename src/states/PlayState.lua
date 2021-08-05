Class = require 'lib/class'
require 'src/states/BaseState'
require 'src/Paddle'
require 'src/Ball'

PlayState = Class{__includes = BaseState}

local highlighted = 1

function PlayState:init()
    self.paddle = Paddle(1,2)
    self.ball = Ball(1)
    self.ball:start()
    self.paused = false
end

function PlayState:update(dt)
    if self.paused then

        if love.keyboard.wasPressed('escape') then
            gSounds['pause']:play()
            self.paused = false
        end

        if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
            highlighted = highlighted == 1 and 2 or 1
            gSounds['paddle-hit']:play()
        end

        if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
            gSounds['pause']:play()

            if highlighted == 1 then
                self.paused = false
            else
                gStateMachine:change('start')
            end
        else
            return
        end

    elseif love.keyboard.wasPressed('escape') then
        self.paused = true
        gSounds['pause']:play()
        return
    end

    self.paddle:update(dt)
    self.ball:update(dt)

    if self.ball:collides(self.paddle) then
        self.ball.dy = -self.ball.dy
        gSounds['paddle-hit']:play()
    end

end

function PlayState:render()
    self.paddle:render()
    self.ball:render()

    if self.paused then
        love.graphics.setColor(COLLORS['white'])
        love.graphics.setFont(gFonts['large'])
        love.graphics.printf("PAUSED", 0, VIRTUAL_HEIGHT / 4 - 16, VIRTUAL_WIDTH, 'center')

        love.graphics.setFont(gFonts['small'])
        if highlighted == 1 then
            love.graphics.setColor(COLLORS['other'])
        end

        love.graphics.printf("Continue", 0, VIRTUAL_HEIGHT / 2 - 32, VIRTUAL_WIDTH, 'center')
        if highlighted == 2 then
            love.graphics.setColor(COLLORS['other'])
        end
        love.graphics.printf("Exit", 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, 'center')

        love.graphics.setColor(COLLORS['white'])
    end
end