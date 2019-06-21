module(..., package.seeall)

function new()
local localGroup = display.newGroup()


local coverbkg = display.newImage("heewan.jpg", 240,160)
localGroup:insert(coverbkg)

local title = display.newText ("Heathen", 240, 100,"Heatan.ttf",100)
title:setFillColor( 0.862745, 0.0784314, 0.235294)
localGroup:insert(title)

local startbutton = display.newRect (240, 205, 100,25)
startbutton : setFillColor ()
startbutton.alpha = .01
localGroup:insert(startbutton)

local start = display.newText ("Start", 240, 205, "prin.ttf",24)
start:setFillColor(1,.843137,0)
localGroup:insert(start)

local creditbutton = display.newRect (240, 275, 120,25)
creditbutton : setFillColor ()
creditbutton.alpha = .01
localGroup:insert(creditbutton)

local credit = display.newText ("Credits", 240, 275, "prin.ttf",24)
credit:setFillColor(1,.843137,0)
localGroup:insert(credit)


local instbutton = display.newRect (240, 240, 170,25)
instbutton : setFillColor ()
instbutton.alpha = .01
localGroup:insert(instbutton)

local inst = display.newText ("Instructions", 240, 240, "prin.ttf",24)
inst:setFillColor(1,.843137,0)
localGroup:insert(inst)


local function pressStart (event)
if event.phase == "ended" then
director:changeScene ("Start")
end
end

startbutton:addEventListener ("touch", pressStart)

local function pressCredit (event)
if event.phase == "ended" then
director:changeScene ("Credit")
end
end

creditbutton:addEventListener ("touch", pressCredit)

local function pressInst (event)
if event.phase == "ended" then
director:changeScene ("Inst")
end
end

instbutton:addEventListener ("touch", pressInst)




return localGroup
end