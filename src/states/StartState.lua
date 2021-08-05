Class = require 'lib/class'
require 'src/states/BaseState'

StartState = Class{__includes = BaseState}

local highlighted = 1

function StartState:init(menuEntries)
    self.maxMenuEntries = 1
    self.menuEntries = menuEntries

    for index, _ in pairs(self.menuEntries) do
        self.maxMenuEntries = index
    end

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
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gSounds['confirm']:play()
        gStateMachine:change(self.menuEntries[highlighted].state)
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function StartState:render()

    love.graphics.setColor(COLLORS['gametitle'])
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf("ARKANEDROID", 0, 10, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])

    local positionVal = 30

    for index, entry in pairs(self.menuEntries) do

        if highlighted == index then
            love.graphics.setColor(COLLORS['other'])
        else
            love.graphics.setColor(COLLORS['white'])
        end

        love.graphics.printf(
            tostring(entry.text),
            0,
            VIRTUAL_HEIGHT / 2 + positionVal + (20 * (index - 1)),
            VIRTUAL_WIDTH,
            'center'
        )

    end

    love.graphics.setColor(COLLORS['white'])
end