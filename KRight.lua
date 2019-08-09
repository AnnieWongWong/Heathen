module(..., package.seeall)

function new()
local localGroup = display.newGroup()

--dialogue

local text = {"You walk through the cave opening and into the light","All of a sudden a swarm of bats attack you",
"They aim for your eyes and just about everything else","But, good thing you have your rusty knife","You manage to slaughter the bats and suffer minor injuries",
"Then your stomach grumbles","You must be hungry"}

local eat = {"If you are hungry, you must eat","You do not have anything to cook the bats with, so you eat them raw","Your hearbeat suddenly rises and you grow dizzy",
"After finding a place to lie down you decide to take a nap","But you never wake up again...",""}

local noeat = {"You decide to leave the bats alone and to continue walking","What if they had some disease?","It is too risky","As you keep walking the hunger finally gets to you and you grow weaker","Then you stumble across another room",""}



--background art by Moritz Burkart  https://www.artstation.com/artist/moritzburkart

bkg= display.newImage("pics/rsz_5bats.jpg", 240,100);
localGroup:insert(bkg)

hp = display.newText("HP : 100", 35,30,"font/Bucket.ttf",30)
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

O1 = display.newText ("Eat the bats for energy", 240,80,"font/Bucket.ttf",20)
O1.alpha =0
localGroup:insert(O1)

O2 = display.newText ("Leave them", 240,150,"font/Bucket.ttf",20)
O2.alpha =0
localGroup:insert(O2)



--Options pop up , hp update
a=1
local function change()
	if (a>=1) and (a<=#text) then
	A.text=text[a]
	a=a+1
end
	if (a == 3) then
	hp.text = "HP :  80"
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

local function presseat (event)
	
	if event.phase == "ended" then
	A.text=eat[1]
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
local function eatB()
	if (b>=2) and (b<=#eat) then
	A.text = eat[b]
	b=b+1
end
	if (b == #eat) then
	hp.text = "HP :   0"
end	
    if (b==#eat+1) then
    director:changeScene ("DieBye")
end
end

bbox : addEventListener ("tap", eatB)
Rect:addEventListener ("touch", presseat)


-- Pressed option 2 

c=1

local function pressNoeat (event)
	
	if event.phase == "ended" then
	A.text=noeat[1]
	c=c+1
	box.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    bbox.alpha = .7
end
end

-- option 2 dialogue play scene change
local function Noeat()
	if (c>=2) and (c<=#noeat) then
	A.text = noeat[c]
	c=c+1
end
    if (c==#noeat+1) then
    director:changeScene ("Knoeat")
end
end

bbox : addEventListener ("tap", Noeat)
Rect2:addEventListener ("touch", pressNoeat)




return localGroup
end