
module(..., package.seeall)

function new()
local localGroup = display.newGroup()


--dialogue

local text = {"Now that your bleeding has stopped you decide to take it easy","You stroll over to the other side of the cave","Suddenly you feel your foot kick something",
"Rocks fall from the ceiling and crush you","So this is why the old man was so injured","You struggle to lift the boulders on top of you", "As you try to move the one last boulder from the top of your left leg you\n realize that it is too heavy",
"Even if you were able to move it your leg is completly crushed underneath\n and useless"}
local cut = {"Since you are already so injured you decide that one more injury would be\n nothing", "with your rusty knife you begin to saw off your leg","It is not an easy task","the process is slow and painful","Once you free yourself you immedielty begin to crawl out of the\n room","And...","You feel the light hit your face", "You are out",
"Although you lost a leg and don't know who you are, you made it out\n alive","But...","But . . . Where are you?",""}
local wait = {"You decide that it is too risky to cut your leg off since you are already\n at the edge of dying","You can't afford anymore injuries so you lay there and wait",
"At times you would shout for help but it was useless","After waiting for 3 days....","You bleed out and die","...",""}

--background art by Andrea Petrosino https://www.artstation.com/artist/petroritrartista

bkg = display.newImage("pics/rsz_guy.jpg",230,-50);
localGroup:insert(bkg) 

bkg2 = display.newImage("pics/rsz_andrea.jpg",250,260);
localGroup:insert(bkg2)
bkg2.alpha=0

--background art by heewann kim  https://www.artstation.com/artist/heewann
bkg3 =  display.newImage("pics/rsz_83.jpg",300,110);
localGroup:insert(bkg3)
bkg3.alpha=0


hp = display.newText("HP : 75", 35,30,"font/Bucket.ttf",30)
hp : setFillColor (0.862745, 0.0784314, 0.235294)
localGroup:insert(hp)


--Quit button ((Code inspired by Peach Pellen http://techority.com/2010/11/19/how-to-use-scenesscreens-in-corona/ )

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

O1 = display.newText ("Cut off your leg", 240,80,"font/Bucket.ttf",20)
O1.alpha =0
localGroup:insert(O1)

O2 = display.newText ("Wait for help", 240,150,"font/Bucket.ttf",20)
O2.alpha =0
localGroup:insert(O2)



--Options pop up 
a=1
local function change()
	if (a>=1) and (a<=#text) then
	A.text=text[a]
	a=a+1
end
	if (a==5) then
	hp.text = "HP :   5"
end	
	if (a == #text+1 ) then
	Rect.alpha= .7
	Rect2.alpha=.7
	O1.alpha = 1
	O2.alpha = 1
	end
end 

box:addEventListener("tap", change)




--Pressed option 1
b=1

local function presscut(event)
	
	if event.phase == "ended" then
	A.text=cut[1]
	b=b+1
	box.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    bbox.alpha = .7
end
end

-- option 1 dialogue play , background update, scene change

local function cutB()
	if (b>=2) and (b<=#cut) then
	A.text = cut[b]
	b=b+1
end
	if (b==#cut - 4) then 
	bkg.alpha = 0
	bkg2.alpha = 1
end	
	if (b==#cut - 3) then
	bkg2.alpha = 0
	bkg3.alpha = 1
end		
    if (b==#cut+1) then
    director:changeScene ("Congrats")
end
end

bbox : addEventListener ("tap", cutB)
Rect:addEventListener ("touch", presscut)


-- Pressed option 2

c=1

local function presswait (event)
	
	if event.phase == "ended" then
	A.text=wait[1]
	c=c+1
	box.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    bbox.alpha = .7
end
end

-- option 2 dialogue play, hp update, scene change
local function waitB()
	if (c>=2) and (c<=#wait) then
	A.text = wait[c]
	c=c+1
end
	if (c == #wait-1) then
	hp.text = "HP :   0"
end	
    if (c==#wait+1) then
    director:changeScene ("DieBye")
end
end

bbox : addEventListener ("tap", waitB)
Rect2:addEventListener ("touch", presswait)





return localGroup
end

