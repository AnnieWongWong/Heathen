module(..., package.seeall)

function new()
local localGroup = display.newGroup()


--dialogue

local text = {""}

local Cross = {"", "a"}

local NoCross = {"","a"}

--background

local bkg = display.newImage ("pics/rsz_guy.jpg",230,-50)
localGroup:insert(bkg)

hp = display.newText("HP :  95", 35,30,"font/Bucket.ttf",30)
hp : setFillColor (0.862745, 0.0784314, 0.235294)
localGroup:insert(hp)


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


--Text Boxes
box = display.newRect (240, 260, 530,90)
box : setFillColor ()
box.alpha = .5
localGroup:insert(box)

bbox = display.newRect (240, 260, 530,90)
bbox : setFillColor ()
bbox.alpha = 0
localGroup:insert(bbox)


-- Initial Text

A = display.newText("", 20,230,"font/Sere.ttf",25)
A:setFillColor(0.254902, 0.411765, 0.882353)
A.anchorX=0
A.anchorY=0
localGroup:insert(A)



-- Option Buttons

Rect = display.newRoundedRect( 240, 80, 230, 30, 5 )
Rect.strokeWidth = 3
Rect:setFillColor()
Rect.alpha= 0
Rect:setStrokeColor( 144, 238, 144)
localGroup:insert(Rect)

Rect2 = display.newRoundedRect( 240, 150, 230, 30, 5 )
Rect2.strokeWidth = 3
Rect2:setFillColor()
Rect2.alpha= 0
Rect2:setStrokeColor( 144, 238, 144)
localGroup:insert(Rect2)

O1 = display.newText ("Cross, What could happen?", 240,80,"font/Bucket.ttf",20)
O1.alpha =0
localGroup:insert(O1)
O2 = display.newText ("Find another way to the exit", 240,150,"font/Bucket.ttf",20)
O2.alpha =0
localGroup:insert(O2)




--Options pop up (Self Created)
a=1
local function change()
	if (a>=1) and (a<=#text) then
	A.text=text[a]
	a=a+1
end
	if (a == #text+1 ) then
	Rect.alpha= .7
	Rect2.alpha=.7
	O1.alpha = 1
	O2.alpha = 1
	end
end 

box:addEventListener("tap", change)




--Pressed "Right" (Self Created)
b=1

local function pressCross (event)
	
	if event.phase == "ended" then
	A.text=Cross[1]
	b=b+1
	box.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    bbox.alpha = .7
end
end

--dialogue play and scene change after pressing right (Self Created)

local function CrossB()
	if (b>=2) and (b<=#Cross) then
	A.text = Cross[b]
	b=b+1
end
    if (b == #Cross+1) then
    director:changeScene ("KCross")
end
end

Rect:addEventListener ("touch", pressCross)
bbox : addEventListener ("tap", CrossB)


-- Pressed "Left" (self Created)

c=1

local function pressNo (event)
	if event.phase == "ended" then
	A.text=NoCross[1]
	c=c+1
	box.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    bbox.alpha = .7
end
end

----dialogue play and scene change after pressing left (Self Created)
local function NoB()
	if (c>=2) and (c<=#NoCross) then
	A.text = NoCross[c]
	c=c+1
end
    if (c==#NoCross+1) then
    director:changeScene ("KNoCross")
end
end

Rect2:addEventListener ("touch", pressNo)
bbox : addEventListener ("tap", NoB)




return localGroup
end