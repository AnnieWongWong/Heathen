

module(..., package.seeall)

function new()
local localGroup = display.newGroup()


--dialogue

local Scene2text = {"As you open your eyes you find yourself lying down on the cold stone floor \nof a cave", "How did you get here?", 
"Well that is the least of your worries", "You are hungry and thirsty", "Your main objective is to get out alive", "You see a rusty knife on your right side",
 " Would you like to take it with you?"}

local Yes = {"You pick up the knife and start to walk towards what you think will lead you\n to the exit",""}

local No = {"You decide to leave the knife because the cons of carrying it outweigh\n the pros", 
"After staring at the knife for a few more seconds you get up and walk\n towards what you think will lead you to the exit",""}



--background art by heewann kim  https://www.artstation.com/artist/heewann

bkg2 = display.newImage("pics/kim1.jpg", 240,230);
localGroup:insert(bkg2)

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
Scene2box = display.newRect (240, 260, 530,90)
Scene2box : setFillColor ()
Scene2box.alpha = .7
localGroup:insert(Scene2box)

Scene2bbox = display.newRect (240, 260, 530,90)
Scene2bbox : setFillColor ()
Scene2bbox.alpha = 0
localGroup:insert(Scene2bbox)


-- Initial Text

B = display.newText(". . .", 20,230,"font/Sere.ttf",25)
B:setFillColor(0.254902, 0.411765, 0.882353)
B.anchorX=0
B.anchorY=0
localGroup:insert(B)



-- Option Buttons
-- local function Rect()
Rect = display.newRoundedRect( 240, 80, 230, 30, 5 )
Rect.strokeWidth = 3
Rect:setFillColor()
Rect.alpha = 0
Rect:setStrokeColor( 144, 238, 144)
localGroup:insert(Rect)
-- end


Rect2 = display.newRoundedRect( 240, 150, 230, 30, 5 )
Rect2.strokeWidth = 3
Rect2:setFillColor()
Rect2.alpha = 0
Rect2:setStrokeColor( 144, 238, 144)
localGroup:insert(Rect2)

O1 = display.newText ("Yes, I'm Weak", 240,80,"font/Bucket.ttf",20)
O1.alpha = 0
localGroup:insert(O1)

O2 = display.newText ("Nah, I'm Good", 240,150,"font/Bucket.ttf",20)
O2.alpha = 0
localGroup:insert(O2)



--Options pop up 
a=1
local function change2()
	if (a>=1) and (a<=#Scene2text) then
	B.text=Scene2text[a]
	a=a+1
end
	if (a == #Scene2text+1 ) then
	Rect.alpha = .7
	Rect2.alpha =.7
	O1.alpha = 1
	O2.alpha = 1
	end
end 

Scene2box:addEventListener("tap", change2)




--Pressed option1
b=1

local function pressYea (event)
	
	if event.phase == "ended" then
	B.text=Yes[1]
	b=b+1
	Scene2box.alpha = 0
	Rect.alpha = 0
	Rect2.alpha = 0
	O1.alpha = 0
	O2.alpha = 0
    Scene2bbox.alpha = .7
end
end

--option 1 dialogue play , scene change
local function YeaB()
	if (b>=2) and (b<=#Yes) then
	B.text = Yes[b]
	b=b+1
end
    if (b==#Yes+1) then
    director:changeScene ("Knife")
end
end

Scene2bbox : addEventListener ("tap", YeaB)
Rect:addEventListener ("touch", pressYea)


-- Pressed option 2 

c=1

local function pressNo (event)
	
	if event.phase == "ended" then
	B.text=No[1]
	c=c+1
	Scene2box.alpha=0
	Rect.alpha = 0
	Rect2.alpha = 0
	O1.alpha = 0
	O2.alpha = 0
    Scene2bbox.alpha = .7
end
end

-- option 2 dialogue play scene change
local function NoB()
	if (c>=2) and (c<=#No) then
	B.text = No[c]
	c=c+1
end
    if (c==#No+1) then
    director:changeScene ("NoKnife")
end
end

Scene2bbox : addEventListener ("tap", NoB)
Rect2:addEventListener ("touch", pressNo)





return localGroup
end

