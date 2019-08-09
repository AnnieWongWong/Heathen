module(..., package.seeall)

function new()
local localGroup = display.newGroup()


--dialogue

local text = {"You enter the outside world", "OLD MAN : it's nice to be outside after being stuck in there for so long", 
"You take a moment to breathe in the fresh air", "OLD MAN : im sorry....", " OLD MAN : in the time that i have been with you, you have done nothing wrong..",
 "OLD MAN : but because of your past i cannot let you live...", "He pulls a knife out of his backpack and begins to charge at you", 
 "As you are both injured, it is a relatively quick and fair fight", "In the end you come out on top and the old man is knocked to the ground", "OLD MAN : kill me...",
 "OLD MAN : I'd rather die than go on living as the idiot who helped the heretic"}
local  kill= {"You decide to do as he asks and end his life","At his last breath he mutters his thanks","But becasue the old man is gone you still do not know who you are",
 " and you have no where to go","What will you do now?",""}
local  nokill= {"Killing him is not the right thing to do","if he dies where will you go and who will tell you who you are ",
"with the old man alive you can live with him for a short while and figure \nout what you are going to do after","OLD MAN : .....","You follow the old man into the forest",""}

--background
-- bacground art by heewann kim https://www.artstation.com/artist/heewann
bkg = display.newImage("pics/tree.jpg",250,160);
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

O1 = display.newText ("End him", 240,80,"font/Bucket.ttf",20)
O1.alpha =0
localGroup:insert(O1)

O2 = display.newText ("Spare his life", 240,150,"font/Bucket.ttf",20)
O2.alpha =0
localGroup:insert(O2)



--Options pop up 
a=1
local function change()
	if (a>=1) and (a<=#text) then
	A.text=text[a]
	a=a+1
end
	if (a==10) then
		hp.text = "HP :  85"
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

local function presskill(event)
	
	if event.phase == "ended" then
	A.text=kill[1]
	b=b+1
	box.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    bbox.alpha = .7
end
end


--option 1 dialogue play and scene change
local function killB()
	if (b>=2) and (b<=#kill) then
	A.text = kill[b]
	b=b+1
end  	
    if (b==#kill+1) then
    director:changeScene ("Congrats")
end
end

bbox : addEventListener ("tap", killB)
Rect:addEventListener ("touch", presskill)


-- Pressed option 2 

c=1

local function pressnokill (event)
	
	if event.phase == "ended" then
	A.text=nokill[1]
	c=c+1
	box.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    bbox.alpha = .7
end
end
 

-- option 2 dialogue play and scene change 
local function nokillB()
	if (c>=2) and (c<=#nokill) then
	A.text = nokill[c]
	c=c+1
end
    if (c==#nokill+1) then
    director:changeScene ("Congrats")
end
end

bbox : addEventListener ("tap", nokillB)
Rect2:addEventListener ("touch", pressnokill)





return localGroup
end
