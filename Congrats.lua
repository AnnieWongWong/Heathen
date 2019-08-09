module(..., package.seeall)

function new()
local localGroup = display.newGroup()


-- Congratulations background art by sonja-christoph (https://www.artstation.com/artist/srchristoph)
local bkg = display.newImage ("pics/son.jpg",240,160)
localGroup:insert(bkg)

-- congratulations display
congrats = display.newText("Congratulations You Win", 240, 70, "font/precious.ttf", 45)
congrats:setFillColor(0.117647, 0.564706, 1)
localGroup:insert(congrats)


back = display.newText("BacktoHome", 70, 300, "font/prin.ttf", 30)
back:setFillColor(0.117647, 0.564706, 1)
localGroup:insert(back)

-- "restart/ back to home button"
local function pressback (event)
if event.phase == "ended" then
director:changeScene ("home")
end
end

back:addEventListener ("touch", pressback)

return localGroup
end