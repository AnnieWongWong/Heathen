module(..., package.seeall)

function new()
local localGroup = display.newGroup()


--dialogue

local text = {"You walk for what feels like miles until you come across a new biome", "There was no warning, in a flash what surrounds you is no longer dirt\n and stone, but water and ice",
"Across the icy room you see another opening", "the floor is slippery","You must take each step with caution, for one slip could cause great\n injury", "Would you like to cross the ice?"}                                                                                                                      
local Cross = {"You take one step at a time","And slowly but surely you close in on the other side of the room","But just as you take the last step.......","But just as you take the last step....... you slip",
"Because you were holding a knife in your hand when you slip, you\n stab yourself in the lower stomach","But you have nothing to bandage yourself with, so all you can do is watch\n your blood flow",
"You get up and staggar towards the next cave room after realizing you need\n to get out to find help even more urgently than before", ""}		     
local NoCross = {"You decide that crossing the slippery ice might be too dangerous and\n go searching for another way to get to the other side",
"It takes you a very long while to find it (about half a day)", "All you had to do was slide on your back across the ice instead of walking\n across it",
"but because it took you so long to figure and you had no food on you, you\n grow weak due to starvation ","But you are able to continue on", ""}

--background art by Ilya Nazarov https://www.artstation.com/artist/ilyanazarov

local bkg = display.newImage ("pics/rsz_ice.jpg",230,70)
localGroup:insert(bkg)

hp = display.newText("HP : 100", 35,30,"font/Bucket.ttf",30)
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

O1 = display.newText ("Cross, What could happen?", 240,80,"font/Bucket.ttf",20)
O1.alpha =0
localGroup:insert(O1)
O2 = display.newText ("Find another way to the exit", 240,150,"font/Bucket.ttf",20)
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




--Pressed "Cross" 
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

--dialogue play, Hp update, scene change after pressing option 1

local function CrossB()
	if (b>=2) and (b<=#Cross) then
	A.text = Cross[b]
	b=b+1
end
	if (b==5) then
	hp.text = " HP:  20"
end	
    if (b == #Cross+1) then
    director:changeScene ("KCross")
end
end

Rect:addEventListener ("touch", pressCross)
bbox : addEventListener ("tap", CrossB)


-- Pressed option 2
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

----dialogue play, HP update, scene change after clicking option 2 
local function NoB()
	if (c>=2) and (c<=#NoCross) then
	A.text = NoCross[c]
	c=c+1
end
	if (c==5) then
	hp.text = "HP:  95"
end	
    if (c==#NoCross+1) then
    director:changeScene ("KNoCross")
end
end

Rect2:addEventListener ("touch", pressNo)
bbox : addEventListener ("tap", NoB)




return localGroup
end