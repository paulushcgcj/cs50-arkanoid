Class = require 'lib/class'
require 'src/states/BaseState'

StartState = Class{__includes = BaseState}

local highlighted = 1

function StartState:init()
    self.maxMenuEntries = 2
    self.menuEntries = {"START","HIGH SCORES"}
end

function StartState:update(dt)

    if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then

        if love.keyboard.wasPressed('up') then
            highlighted = highlighted - 1
        elseif love.keyboard.wasPressed('down') then
            highlighted = highlighted + 1
        end

        if highlighted > self.maxMenuEntries then
            highlighted = 1
        end
        if highlighted < 1 then
            highlighted = self.maxMenuEntries
        end
        gSounds['paddle-hit']:play()
        print('Highlighted as '..tostring(highlighted))
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function StartState:render()

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf("ARKANEDROID", 0, 10, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])

    local positionVal = 30

    for index, entry in pairs(self.menuEntries) do

        if highlighted == index then
            love.graphics.setColor(0.45, 1, 1, 1)
        else
            love.graphics.setColor(1, 1, 1, 1)
        end

        love.graphics.printf(
            tostring(entry),
            0,
            VIRTUAL_HEIGHT / 2 + positionVal + (20 * (index - 1)),
            VIRTUAL_WIDTH,
            'center'
        )

    end

    love.graphics.setColor(255, 255, 255, 255)
end