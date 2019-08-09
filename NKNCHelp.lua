
module(..., package.seeall)

function new()
local localGroup = display.newGroup()


--dialogue

local text = {"The old man leads you to another crevice in a wall", "After helping him through, you also enter the next room", 
"OLD MAN : There, that's the exit across this lake","OLD MAN : You seem like a better man than the rumors say....", "OLD MAN : or is it because you've lost your memories", 
"OLD MAN : We need to swim across to get to the exit"}
local swim = {"OLD MAN : I'm afraid that if we try to find another path around we may fall\n into a trap",
"You and the old man jump into the water and slowly swim across", "The old man arrogantly pushed you away whenever you tried to help him swim",
 "when you reach the other side you realize the old man is missing","Will you go back to find him?"}
 local help = {"You swim back to look for the old man", " You find him struggling to swim back up at the bottom of the lake and bring\n him back up and across the lake", "OLD MAN: ....thank you"}
 local nohelp = {"You decide to leave the old man behind", "You have no use for him anymore since you have already found the exit", " but right as you are about to walk out of the cave you feel a sharp blade\n pierce through your back and you fall to the ground", 
 "OLD MAN : hahahhahahahhahah I know what kind of person you are","OLD MAN : I knew you would try to leave me, you deserve this hahahahah",""}
local noswim = {"You decide to find a way around the lake","But as you walk around with the old man, he trips on a strange wire","It is a trap", 
"Stalagtites fall from the ceiling...", "Ending the old man and your life","...",""}

--background art by Raphael Lacoste https://www.artstation.com/artist/raphael-lacoste

bkg = display.newImage("pics/rsz_raph.jpg",250,130);
localGroup:insert(bkg)

hp = display.newText("HP :  95", 35,30,"font/Bucket.ttf",30)
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


O1 = display.newText ("Swim across", 240,80,"font/Bucket.ttf",20)
O1.alpha =0
localGroup:insert(O1)

O2 = display.newText ("Find a way around", 240,150,"font/Bucket.ttf",20)
O2.alpha =0
localGroup:insert(O2)

O3 = display.newText ("Find the old man", 240,80,"font/Bucket.ttf",20)
O3.alpha =0
localGroup:insert(O3)

O4 = display.newText ("Leave the old man", 240,150,"font/Bucket.ttf",20)
O4.alpha =0
localGroup:insert(O4)

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




--Pressed option 1
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

-- option 1 options pop up

local function swimB()
	if (b>=2) and (b<=#swim) then
	A.text = swim[b]
	b=b+1
end
    if (b==#swim+1) then
  	Rect3.alpha= .7
	Rect4.alpha=.7
	O3.alpha = 1
	O4.alpha = 1
end
end

bbox : addEventListener ("tap", swimB)
Rect:addEventListener ("touch", pressswim)


-- press option 3 

d=1

local function pressBackHelp (event)
	
	if event.phase == "ended" then
	A.text=help[1]
	d=d+1
	Rect3.alpha= 0
	Rect4.alpha= 0
	O3.alpha = 0
	O4.alpha = 0
    bbox.alpha = 0
    bbbox.alpha =.7
end
end

--option 3 dialogue play
local function BackHelpB()
	if (d>=2) and (d<=#help) then
	A.text =help[d]
	d=d+1
end
     if (d == #help+1) then
    director:changeScene ("NKNCwaterhelp")
end
end

Rect3:addEventListener ("touch", pressBackHelp)
bbbox :addEventListener("tap",BackHelpB)




-- press option 4 

e=1

local function pressnoBackHelp (event)
	
	if event.phase == "ended" then
	A.text=nohelp[1]
	e=e+1
	Rect3.alpha= 0
	Rect4.alpha= 0
	O3.alpha = 0
	O4.alpha = 0
    bbox.alpha = 0
    bbbox.alpha =.7
end
end


--option 4 dialogue play , hp update

local function noBackHelpB()
	if (e>=2) and (e<=#nohelp) then
	A.text = nohelp[e]
	e=e+1
end
	if (e == #nohelp-2) then
	hp.text = "HP :   0"
end	
     if (e == #nohelp+1) then
    director:changeScene ("DieBye")
end
end

Rect4:addEventListener ("touch", pressnoBackHelp)
bbbox :addEventListener("tap",noBackHelpB)



-- press option 2

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

--option 2 dialogue play

local function noswimB()
	if (c>=2) and (c<=#noswim) then
	A.text = noswim[c]
	c=c+1
end
    if (c==#noswim+1) then
    director:changeScene ("DieBye")
end
end

bbox : addEventListener ("tap", noswimB)
Rect2:addEventListener ("touch", pressnoswim)





return localGroup
end
