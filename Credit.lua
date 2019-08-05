module(..., package.seeall)

function new()
local localGroup = display.newGroup()

local bkg = display.newImage ("pics/rsz_blk.jpg",240,160)
localGroup:insert(bkg)

back = display.newText("Back", 20, 25, "font/prin.ttf", 27)
back:setFillColor(1,.843137,0)
localGroup:insert(back)

local function pressback (event)
if event.phase == "ended" then
director:changeScene ("home")
end
end

back:addEventListener ("touch", pressback)


return localGroup
end