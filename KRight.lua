module(..., package.seeall)

function new()
local localGroup = display.newGroup()

local bkg = display.newImage ("pics/rsz_cave3.jpg",360,120)
localGroup:insert(bkg)

--Quit button (self Created)


quit = display.newText("QUIT", 480, 20, "font/prin.ttf", 10)
quit:setFillColor(1,.843137,0)
localGroup:insert(quit)

local function pressquit (event)
	if event.phase == "ended" then
	director:changeScene ("home")
end
end
quit:addEventListener ("touch", pressquit)


return localGroup
end