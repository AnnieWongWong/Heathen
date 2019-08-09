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
local Help = {"Despite the cursing you decide to save the old man","Did you do it out of kindness or to find out who you are?","OLD MAN : thank you...","Well either way the old man is grateful","You question the old man of your past",
"OLD MAN : who you are....","OLD MAN : you are known throughout country, but you are no hero","OLD MAN : You were mentioned often but not by your real name, they called\n you by 'scum' 'heathen' 'heretic' and all kinds of other things",
"OLD MAN : You had gone missing for months and we believed that we had finally\n been blessed with your death.... but you are here","OLD MAN : you seem to have lost your memories .. how dare you forget all the\n sins you have commited","OLD MAN : If you wish to know more you must help me get out of thes damned\n cave first",
"OLD MAN : Don't worry it won't take long I've explored this cave many times\n before so I know the way out","OLD MAN :I shouldn't have gotten injured.. I know this cave like the back of\n my hand..... but the traps are new","OLD MAN : perhaps they were meant for you...",
"You help the old man up and he begins to direct you to the exit","a"}
local NoHelp = {"Getting yourself bandaged up and away from death as possible seems for important\n then helping the rude old man","But as you are about to run away, you realize that you might be missing out\n on an opporunity to learn about your past ", "Are you sure you want to leave the old man?"}
local BackHelp = {"You won't immediately die if you use the supplies on the dying old man, so you\n go back and help","The old man bitterly thanks you and you question the old man of your past", "He spits blood into your face", 
"OLD MAD : I saw what you did, you thought about stealing my supplies or yourself\n and leaving me to die","OLD MAN: You saved me for your own purpose did you not?","OLD MAN : and how dare you forget your past after all the sins you have\n commited",
"OLD MAN: I will not tell you a word of who your are","OLD MAN: but if you help me out of this damned cave I might rethink that", " You help the old man up", 
"OLD MAN : The are traps set in this cave that were not here before, probably\n meant to keep YOU in and other out", "He spits blood in your face again and begins to direct you to the exit","a"}
local NoHelp2 = {"This old man cannot be the only one who knows of your past","If only he had not cursed at you then maybe you would have considered\n saving him","OLD MAN : So you are who they say you are.....",
"OLD MAN : YOU SHOULD HAVE DIED.. THE WHOLE COUNTRY WANTED YOU DEAD,\n IN FACT WE ALL THOUGHT YOU WERE DEAD", "OLD MAN : BUT WHY ARE YOU HERE", "The old man coughs up puddles and puddles of blood","OLD MAN : I hope you burn in hell....", "His head dropped and he became quiet", 
"You know now that there are people out there who know who yoiu are, but\n would they react to your presence liek the old man did?", "You take the supplies abnd bandage yourself up before moving on",""}



--background picture from http://www.tomsguide.com/forum/68494-35-dv9000-fades-black
local bkg = display.newImage ("pics/2n8ohns.jpg",240,180)
localGroup:insert(bkg)

hp = display.newText("HP :  95", 35,30,"font/Bucket.ttf",30)
hp : setFillColor (0.862745, 0.0784314, 0.235294)
localGroup:insert(hp)


--Quit button (((Code inspired by Peach Pellen http://techority.com/2010/11/19/how-to-use-scenesscreens-in-corona/ )

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

bbbox = display.newRect (240, 260, 530,90)
bbbox : setFillColor ()
bbbox.alpha = 0
localGroup:insert(bbbox)

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

Rect3 = display.newRoundedRect( 240, 80, 230, 30, 5 )
Rect3.strokeWidth = 3
Rect3:setFillColor()
Rect3.alpha= 0
Rect3:setStrokeColor( 144, 238, 144)
localGroup:insert(Rect3)

Rect4 = display.newRoundedRect( 240, 150, 230, 30, 5 )
Rect4.strokeWidth = 3
Rect4:setFillColor()
Rect4.alpha= 0
Rect4:setStrokeColor( 144, 238, 144)
localGroup:insert(Rect4)


O1 = display.newText ("Help", 240,80,"font/Bucket.ttf",20)
O1.alpha =0
localGroup:insert(O1)
O2 = display.newText ("Steal supplies for yourself", 240,150,"font/Bucket.ttf",20)
O2.alpha =0
localGroup:insert(O2)
O3 = display.newText ("Turn around and help", 240,80,"font/Bucket.ttf",20)
O3.alpha =0
localGroup:insert(O3)
O4 = display.newText ("Save yourself", 240,150,"font/Bucket.ttf",20)
O4.alpha =0
localGroup:insert(O4)

--Options pop up 
a=1
local function change()
	if (a>=1) and (a<=#text) then
	A.text=text[a]
	a=a+1
end
    if (a==11) then
    bkg.alpha = 0
    ----background art by Andrea Petrosino https://www.artstation.com/artist/petroritrartista

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




--Pressed "Help" 
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

--dialogue play and scene change after pressing Help 

local function HelpB()
	if (b>=2) and (b<=#Help) then
	A.text = Help[b]
	b=b+1
end
    if (b == #Help+1) then
    director:changeScene ("KHelpNoCross")
end
end

Rect:addEventListener ("touch", pressHelp)
bbox : addEventListener ("tap", HelpB)


-- Pressed "NoHelp" 
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

----dialogue play and scene change after pressing NoHelp 
local function NoB()
	if (c>=2) and (c<=#NoHelp) then
	A.text = NoHelp[c]
	c=c+1
end
    if (c==#NoHelp) then
    Rect3.alpha= .7
	Rect4.alpha=.7
	O3.alpha = 1
	O4.alpha = 1
end
end

Rect2:addEventListener ("touch", pressNo)
bbox : addEventListener ("tap", NoB)


-- Go back and help button
d=1

local function pressBackHelp (event)
	
	if event.phase == "ended" then
	A.text=BackHelp[1]
	d=d+1
	Rect3.alpha= 0
	Rect4.alpha= 0
	O3.alpha = 0
	O4.alpha = 0
    bbox.alpha = 0
    bbbox.alpha =.7
end
end
--go back and help dialogue
local function BackHelpB()
	if (d>=2) and (d<=#BackHelp) then
	A.text = BackHelp[d]
	d=d+1
end
     if (d == #BackHelp+1) then
    director:changeScene ("KBackHelpNoCross")
end
end


Rect3:addEventListener ("touch", pressBackHelp)
bbbox :addEventListener("tap",BackHelpB)




-- donthelp button

e=1

local function pressnoBackHelp (event)
	
	if event.phase == "ended" then
	A.text=NoHelp2[1]
	e=e+1
	Rect3.alpha= 0
	Rect4.alpha= 0
	O3.alpha = 0
	O4.alpha = 0
    bbox.alpha = 0
    bbbox.alpha =.7
end
end
--dont help dialogue
local function noBackHelpB()
	if (e>=2) and (e<=#NoHelp2) then
	A.text = NoHelp2[e]
	e=e+1
end
	if (e == #NoHelp2 - 1) then
	hp = "HP : 100"
end	
     if (e == #NoHelp2+1) then
    director:changeScene ("KNoHelpNoCross")
end
end

Rect4:addEventListener ("touch", pressnoBackHelp)
bbbox :addEventListener("tap",noBackHelpB)


return localGroup
end