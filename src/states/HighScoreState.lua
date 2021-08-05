Class = require 'lib/class'
require 'src/states/BaseState'

HighScoreState = Class{__includes = BaseState}

function HighScoreState:init()
end

function HighScoreState:update(dt)
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('start')
    end
end

function HighScoreState:render()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf("HighScoreState", 0, 10, VIRTUAL_WIDTH, 'center')
end