module(..., package.seeall)

function new()
local localGroup = display.newGroup()



-- First Scene dialoguw
local prolouge = { "drip..", "drip.. drip...", "drip.. drip... drip..."}



--background picture from http://www.tomsguide.com/forum/68494-35-dv9000-fades-black
bkg1= display.newImage( "pics/2n8ohns.jpg", 240,180);

--display
firstbox = display.newRect (240, 260, 530,90)
A = display.newText("", 20, 230,"font/Sere.ttf",23)
A : setFillColor (0,0,0)
A.anchorX=0
A.anchorY=0
localGroup:insert(bkg1)
localGroup:insert(firstbox)
localGroup:insert(A)



-- remove screen (self created code)
local function removeProlouge()
	bkg1:removeSelf()
	bkg1= nil
	firstbox : removeSelf()
	firstbox = nil
	A : removeSelf()
end


--dialogue play and scene change
i=1

local function change()
	A.text=prolouge[i]
	i=i+1
	if (i==5) then
	director:changeScene ("Scene2")
end
end

bkg1:addEventListener("tap", change)


return localGroup
end