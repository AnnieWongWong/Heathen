module(..., package.seeall)

function new()
local localGroup = display.newGroup()



-- menu display background art by heewann kim  https://www.artstation.com/artist/heewann
local coverbkg = display.newImage("pics/heewan.jpg", 240,160)
localGroup:insert(coverbkg)

local title = display.newText ("Heathen", 240, 110,"font/Heatan.ttf",100)
title:setFillColor( 0.862745, 0.0784314, 0.235294)
localGroup:insert(title)

local startbutton = display.newRect (240, 205, 100,25)
startbutton : setFillColor ()
startbutton.alpha = .01
localGroup:insert(startbutton)

local start = display.newText ("Start", 240, 205, "font/prin.ttf",24)
start:setFillColor(1,.843137,0)
localGroup:insert(start)

local creditbutton = display.newRect (240, 275, 120,25)
creditbutton : setFillColor ()
creditbutton.alpha = .01
localGroup:insert(creditbutton)

local credit = display.newText ("Credits", 240, 275, "font/prin.ttf",24)
credit:setFillColor(1,.843137,0)
localGroup:insert(credit)

local instbutton = display.newRect (240, 240, 170,25)
instbutton : setFillColor ()
instbutton.alpha = .01
localGroup:insert(instbutton)

local inst = display.newText ("Instructions", 240, 240, "font/prin.ttf",24)
inst:setFillColor(1,.843137,0)
localGroup:insert(inst)




-- Start Game button (Code inspired by Peach Pellen http://techority.com/2010/11/19/how-to-use-scenesscreens-in-corona/ )
local function pressStart (event)
	if event.phase == "ended" then
	director:changeScene ("Start")
	end
end

startbutton:addEventListener ("touch", pressStart)


-- Credit button (Code inspired by Peach Pellen http://techority.com/2010/11/19/how-to-use-scenesscreens-in-corona/ )
local function pressCredit (event)
	if event.phase == "ended" then
	director:changeScene ("Credit")
	end
end

creditbutton:addEventListener ("touch", pressCredit)


-- Instructions button (Code inspired by Peach Pellen http://techority.com/2010/11/19/how-to-use-scenesscreens-in-corona/ )
local function pressInst (event)
	if event.phase == "ended" then
	director:changeScene ("Inst")
	end
end

instbutton:addEventListener ("touch", pressInst)



return localGroup
end