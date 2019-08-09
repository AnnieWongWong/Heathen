module(..., package.seeall)

function new()
local localGroup = display.newGroup()

--dialogue

local text = {"You come across another room"," but the floor is covered in stalagmites"}

local straight = {"You decide to charge through the stalagmites","you slip and fall","With your bad luck you manage to land backwards on a stalagmite...",""}

local dodge = {"As you turn around to leave the room you slip on a leftover bat","To your luck you land front-first onto a stalagmite... ",""}



--background art by Takuma Omichi  https://www.artstation.com/artist/takumaomichi

bkg= display.newImage("pics/rsz_omich.jpg", 250,60);
localGroup:insert(bkg)

hp = display.newText("HP :  80", 35,30,"font/Bucket.ttf",30)
hp : setFillColor (0.862745, 0.0784314, 0.235294)
localGroup:insert(hp)


--Quit button (Code inspired by Peach Pellen http://techority.com/2010/11/19/how-to-use-scenesscreens-in-corona/ )


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
box.alpha = .7
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

O1 = display.newText ("Charge through them", 240,80,"font/Bucket.ttf",20)
O1.alpha =0
localGroup:insert(O1)

O2 = display.newText ("Find a different route", 240,150,"font/Bucket.ttf",20)
O2.alpha =0
localGroup:insert(O2)



--Options pop up 
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




--Pressed option1
b=1

local function presscharge (event)
	
	if event.phase == "ended" then
	A.text=straight[1]
	b=b+1
	box.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    bbox.alpha = .7
end
end

--option 1 dialogue play , scene change, hp update
local function chargeB()
	if (b>=2) and (b<=#straight) then
	A.text = straight[b]
	b=b+1
end
	if (b==#straight) then
	hp.text = "HP :   0"
end		
    if (b==#straight+1) then
    director:changeScene ("DieBye")
end
end

bbox : addEventListener ("tap", chargeB)
Rect:addEventListener ("touch", presscharge)


-- Pressed option 2 

c=1

local function pressDodge (event)
	
	if event.phase == "ended" then
	A.text=dodge[1]
	c=c+1
	box.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    bbox.alpha = .7
end
end

-- option 2 dialogue play scene change, hp update
local function DodgeB()
	if (c>=2) and (c<=#dodge) then
	A.text =dodge[c]
	c=c+1
end
	if (c==#dodge) then
	hp.text = "HP :   0"
end		
    if (c==#dodge+1) then
    director:changeScene ("DieBye")
end
end

bbox : addEventListener ("tap", DodgeB)
Rect2:addEventListener ("touch", pressDodge)




return localGroup
end