module(..., package.seeall)

function new()
local localGroup = display.newGroup()


--dialogue

local text = {"The opening from the icy cave leads you into darkness", 
"As you blindly walk further and further you realize something","Who are you?",
 "Why are you here?", "Why do you not remember anything?", "You reach the end of the corridor without answers", 
 "The entrence to the next room is a small crevice in the wall, just big\n enough for you to squeeze through",
 "As you push yourself through feet first for saftey, you hear faint moaning", 
 "It is too late to run away", "Carefully after getting yourself through, you turn around",
 "In your view is an old man", "He appears to be bleeding excessively, even more than you", "OLD MAN : help..... save me..... please",
  "OLD MAN : there is... medicine... supplies... over there...", " He heaves with every word and barely manages to lift his finger to point\n at a rag-like bag sitting at the center of the room",
   "As you walk closer, you hear a sudden gasp", "OLD MAN : YOU IT'S YOU! *cough* WHY ARE YOU HERE *cough*","OLD MAN : YOU SHOULD BE DEAD *cough* BURNING IN BLOODY HELL *cough*\n YOU. . . YOU. . . HERETIC! *cough cough cough*",
   "OLD MAN : STAY AWAY FROM ME! ", "He shouted as blood gushed from his mouth"}
local Help = {"Despite the cursing you decide to save the old man","Did you do it out of kindness or to find out who you are?","Well either way the old man is grateful to you", "a"}
local NoHelp = {"Getting yourself bandaged up and away from death ","a"}

--background

local bkg = display.newImage ("pics/2n8ohns.jpg",240,180)
localGroup:insert(bkg)

hp = display.newText("HP :  20", 35,30,"font/Bucket.ttf",30)
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

O1 = display.newText ("Help", 240,80,"font/Bucket.ttf",20)
O1.alpha =0
localGroup:insert(O1)
O2 = display.newText ("Steal supplies for yourself", 240,150,"font/Bucket.ttf",20)
O2.alpha =0
localGroup:insert(O2)


--Options pop up (Self Created)
a=1
local function change()
	if (a>=1) and (a<=#text) then
	A.text=text[a]
	a=a+1
end
    if (a==11) then
    bkg.alpha = 0
    bkg2 = display.newImage("pics/rsz_guy.jpg",230,-50)
    bkg2:toBack()
end 
	if (a == #text+1 ) then
	Rect.alpha= .7
	Rect2.alpha=.7
	O1.alpha = 1
	O2.alpha = 1
end
end 

box:addEventListener("tap", change)




--Pressed "Help" (Self Created)
b=1

local function pressHelp (event)
	
	if event.phase == "ended" then
	A.text=Help[1]
	b=b+1
	box.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    bbox.alpha = .5
end
end

--dialogue play and scene change after pressing Help (Self Created)

local function HelpB()
	if (b>=2) and (b<=#Help) then
	A.text = Help[b]
	b=b+1
end
    if (b == #Help+1) then
    director:changeScene ("KCross")
end
end

Rect:addEventListener ("touch", pressHelp)
bbox : addEventListener ("tap", HelpB)


-- Pressed "NoHelp" (self Created)

c=1

local function pressNo (event)
	if event.phase == "ended" then
	A.text=NoHelp[1]
	c=c+1
	box.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    bbox.alpha = .7
end
end

----dialogue play and scene change after pressing NoHelp (Self Created)
local function NoB()
	if (c>=2) and (c<=#NoHelp) then
	A.text = NoHelp[c]
	c=c+1
end
    if (c==#NoHelp+1) then
    director:changeScene ("KNoCross")
end
end

Rect2:addEventListener ("touch", pressNo)
bbox : addEventListener ("tap", NoB)




return localGroup
end