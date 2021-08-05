Class = require 'lib/class'
require 'src/states/BaseState'

CreditsState = Class{__includes = BaseState}

local credits = {
    {text="ARKANEDROID",font='large',color=COLLORS['gametitle']},
    {text="",font='large',color=COLLORS['white']},

    {text="Developer",font='medium_secondary',color=COLLORS['other']},
    {text="Paulo Gomes da Cruz Junior",font='small_secondary',color=COLLORS['white']},
    {text="",font='large_secondary',color=COLLORS['white']},

    {text="Graphics",font='medium_secondary',color=COLLORS['other']},
    {text="https://opengameart.org/users/buch",font='small_secondary',color=COLLORS['white']},
    {text="",font='large_secondary',color=COLLORS['white']},

    {text="Music and SFX",font='medium_secondary',color=COLLORS['other']},
    {text="http://freesound.org/people/joshuaempyre/sounds/251461/",font='small_secondary',color=COLLORS['white']},
    {text="http://www.soundcloud.com/empyreanma",font='small_secondary',color=COLLORS['white']},
    {text="",font='large_secondary',color=COLLORS['white']},

    {text="Code References",font='medium_secondary',color=COLLORS['other']},
    {text="https://github.com/Ulydev/push",font='small_secondary',color=COLLORS['white']},
    {text="https://github.com/vrld/hump/blob/master/class.lua",font='small_secondary',color=COLLORS['white']},
    {text="https://stackoverflow.com/questions/24821045/does-lua-have-something-like-pythons-slice",font='small_secondary',color=COLLORS['white']},
    {text="",font='large_secondary',color=COLLORS['white']},

    {text="Fonts",font='medium_secondary',color=COLLORS['other']},
    {text="GamePlayed by Chequered Ink",font='small_secondary',color=COLLORS['white']},
    {text="Press Start 2P by codeman38",font='small_secondary',color=COLLORS['white']},
    {text="",font='large_secondary',color=COLLORS['white']},

    {text="Special Thanks to",font='medium_secondary',color=COLLORS['other']},
    {text="",font='large_secondary',color=COLLORS['white']},
    {text="Colton Ogden <cogden@cs50.harvard.edu>",font='small_secondary',color=COLLORS['clear']},
    {text="   - for the inspiration to keep up with game development and CS50G",font='small_secondary',color=COLLORS['white']},
    {text="",font='large_secondary',color=COLLORS['white']},
    {text="Ada Ferreira Porto Cruz",font='small_secondary',color=COLLORS['clear']},
    {text="   - for being an amazing wife and supporting me",font='small_secondary',color=COLLORS['white']},
    {text="",font='large_secondary',color=COLLORS['white']},
    {text="Samanta Ferreira Porto Cruz",font='small_secondary',color=COLLORS['clear']},
    {text="   - my lovely daughter who always tested my games",font='small_secondary',color=COLLORS['white']}
}

function CreditsState:init()
    self.scrollPosition = 99
    self.selfReturnAt = 0

    for index, _ in ipairs(credits) do
        self.selfReturnAt = 33 * index
    end

end

function CreditsState:update(dt)
    if love.keyboard.wasPressed('escape') or self.scrollPosition > self.selfReturnAt then
        gStateMachine:change('start')
    end
    self.scrollPosition = self.scrollPosition + (dt * 25)
end

function CreditsState:render()

    for index, credit in ipairs(credits) do
        love.graphics.setColor(credit.color)
        love.graphics.setFont(gFonts[credit.font])
        love.graphics.printf(tostring(credit.text), 0, (VIRTUAL_HEIGHT + (22 * index)) - self.scrollPosition, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(COLLORS['white'])
    end

end
