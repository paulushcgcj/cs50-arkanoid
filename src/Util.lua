function table.slice(tbl, first, last, step)
    local sliced = {}
    for i = first or 1, last or #tbl, step or 1 do
      sliced[#sliced+1] = tbl[i]
    end
    return sliced
end

function GenerateQuads(atlas, tilewidth, tileheight)
    local sheetWidth = atlas:getWidth() / tilewidth
    local sheetHeight = atlas:getHeight() / tileheight

    local sheetCounter = 1
    local spritesheet = {}

    for y = 0, sheetHeight - 1 do
        for x = 0, sheetWidth - 1 do
            spritesheet[sheetCounter] =
                love.graphics.newQuad(
                    x * tilewidth, 
                    y * tileheight, 
                    tilewidth,
                    tileheight, 
                    atlas:getDimensions()
                )
            sheetCounter = sheetCounter + 1
        end
    end

    return spritesheet
end

function getQuad(atlas,spriteTable)

    local counter = 1
    local quads = {}

    for index, spriteDataEntry in ipairs(spriteTable) do
        for key, quadData in pairs(spriteDataEntry) do
            quads[counter] = love.graphics.newQuad(
                quadData.x,
                quadData.y,
                quadData.width,
                quadData.height,
                atlas:getDimensions()
            )
            counter = counter + 1
        end
    end

    return quads
end
