module(..., package.seeall)

function new()
local localGroup = display.newGroup()


--dialogue

local text = {"The  old man leads you to another crevice in a wall", "After helping him through, you also enter the next room", "OLD MAN : There, that's the exit across this lake", "Suddenly the old man stops talking and seemed to be thinking about something",
"He pulls out a knife and aims for you head","OLD MAN : I'd rather die than help you out of this cave, after all you had\n to think twice before saving me!","You and the old man fight","Because you are both injured, it is an equal match",
"He manages to slash your arm, but in the end you win the fight","The old man falls to the ground and gasps for air","OLD MAN : what have I done...","He closed his eyes and layed there lifelessly",
 "You quickly bandage your arm with the old man's supplies and look towards\n the lake now polluted with blood"}
local  swim= {"The old man had mentioned traps before, if you walk around too much you\n might set one off so you decide to swim","Because your wounds are still fresh, as you swim through the lake you begin\n to bleed out","After swimming for a few minutes you reach the end",
"Light shines through the exit","Although heavily injured, you managed to escape the cave","You still do not know who or where you are", "But now a more imporant question remains"," Where will you go now?",""}
local  noswim= {"You decide to find a way around the lake","But as you walked around you trip on a strange wire","It is a trap", " Stalagtites fall from the ceiling...", "Ending your life",""}

--background art by Raphael Lacoste https://www.artstation.com/artist/raphael-lacoste

bkg = display.newImage("pics/rsz_raph.jpg",250,130);
localGroup:insert(bkg)

--background art by heewann kim  https://www.artstation.com/artist/heewann
bkg2 = display.newImage("pics/tree.jpg",250,160);
localGroup:insert(bkg2)
bkg2.alpha=0

hp = display.newText("HP : 95", 35,30,"font/Bucket.ttf",30)
hp : setFillColor (0.862745, 0.0784314, 0.235294)
localGroup:insert(hp)





quit = display.newText("QUIT", 480, 20, "font/prin.ttf", 10)
quit:setFillColor(1,.843137,0)
localGroup:insert(quit)

--Quit button (Code inspired by Peach Pellen http://techority.com/2010/11/19/how-to-use-scenesscreens-in-corona/ )

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

O1 = display.newText ("Swim across", 240,80,"font/Bucket.ttf",20)
O1.alpha =0
localGroup:insert(O1)

O2 = display.newText ("Find a way Around", 240,150,"font/Bucket.ttf",20)
O2.alpha =0
localGroup:insert(O2)



--Options pop up (Self Created code)
a=1
local function change()
	if (a>=1) and (a<=#text) then
	A.text=text[a]
	a=a+1
end
	if (a==10) then
		hp.text = "HP :  25"
end
	if (a == #text+1 ) then
	hp.text= "HP :  30"
	Rect.alpha= .7
	Rect2.alpha=.7
	O1.alpha = 1
	O2.alpha = 1
	end
end 

box:addEventListener("tap", change)




--Pressed option 1 (Self Created code)
b=1

local function pressswim(event)
	
	if event.phase == "ended" then
	A.text=swim[1]
	b=b+1
	box.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    bbox.alpha = .7
end
end

-- dialouge play, hp update, backgroud update, scene change after pressing option 1 (self created code)

local function swimB()
	if (b>=2) and (b<=#swim) then
	A.text = swim[b]
	b=b+1
end
	if (b==3) then
		hp.text = "HP :   26"
end    	
	if (b==5) then
	bkg.alpha=0
	bkg2.alpha=1
end	 
    if (b==#swim+1) then
    director:changeScene ("Congrats")
end
end

bbox : addEventListener ("tap", swimB)
Rect:addEventListener ("touch", pressswim)


-- Pressed option 2 (self Created)

c=1

local function pressnoswim (event)
	
	if event.phase == "ended" then
	A.text=noswim[1]
	c=c+1
	box.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    bbox.alpha = .7
end
end

--dialoge play, hp update, scene change after pressing option 2 (self created code)
local function noswimB()
	if (c>=2) and (c<=#noswim) then
	A.text = noswim[c]
	c=c+1
end
	if (c==4) then
	hp.text = "HP :    0"
end	
    if (c==#noswim+1) then
    director:changeScene ("DieBye")
end
end

bbox : addEventListener ("tap", noswimB)
Rect2:addEventListener ("touch", pressnoswim)





return localGroup
end
