module(..., package.seeall)

function new()
local localGroup = display.newGroup()

--dialogue

local Knifetext = {"After a few minutes of walking, you come across a fork in the road", "As far as you can see, the cave to your right appears to be calmer than\n the one to the left",
"a soft white light emmits from its opening", "But the water crashing out from the cave to your left entices your \n thirst",
 "How long has it been since your last sip of water?"}

local Right = {"You decide to take the more promising path", "As you walk towards the entrance you hear blood curdling screaching", "Welp, it's too late to change your mind",""}

local Left = {"Quenching your thirst is priority, you need to survive before you can get\n out alive","You stroll over to the water and drink your fill", ""}


--background  art by heewann kim  https://www.artstation.com/artist/heewann

local bkg = display.newImage ("pics/rsz_cave3.jpg",320,120)
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
Knifebox = display.newRect (240, 260, 530,90)
Knifebox : setFillColor ()
Knifebox.alpha = .7
localGroup:insert(Knifebox)

Knifebbox = display.newRect (240, 260, 530,90)
Knifebbox : setFillColor ()
Knifebbox.alpha = 0
localGroup:insert(Knifebbox)


-- Initial Text

C = display.newText("", 20,230,"font/Sere.ttf",25)
C:setFillColor(0.254902, 0.411765, 0.882353)
C.anchorX=0
C.anchorY=0
localGroup:insert(C)



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

O1 = display.newText ("Right, Towards the Light", 240,80,"font/Bucket.ttf",20)
O1.alpha =0
localGroup:insert(O1)
O2 = display.newText ("Left, Into the Water", 240,150,"font/Bucket.ttf",20)
O2.alpha =0
localGroup:insert(O2)




--Options pop up 
a=1
local function change3()
	if (a>=1) and (a<=#Knifetext) then
	C.text=Knifetext[a]
	a=a+1
end
	if (a == #Knifetext+1 ) then
	Rect.alpha= .7
	Rect2.alpha=.7
	O1.alpha = 1
	O2.alpha = 1
	end
end 

Knifebox:addEventListener("tap", change3)




--Pressed "Right" 
b=1

local function pressRight (event)
	
	if event.phase == "ended" then
	C.text=Right[1]
	b=b+1
	Knifebox.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    Knifebbox.alpha = .7
end
end

--dialogue play and scene change after pressing right 
local function RightB()
	if (b>=2) and (b<=#Right) then
	C.text = Right[b]
	b=b+1
end
    if (b == #Right+1) then
    director:changeScene ("NKRight")
end
end

Rect:addEventListener ("touch", pressRight)
Knifebbox : addEventListener ("tap", RightB)


-- Pressed "Left" 

c=1

local function pressLeft (event)
	if event.phase == "ended" then
	C.text=Left[1]
	c=c+1
	Knifebox.alpha=0
	Rect.alpha= 0
	Rect2.alpha= 0
	O1.alpha = 0
	O2.alpha = 0
    Knifebbox.alpha = .7
end
end

----dialogue play and scene change after pressing left 
local function LeftB()
	if (c>=2) and (c<=#Left) then
	C.text = Left[c]
	c=c+1
end
    if (c==#Left+1) then
    director:changeScene ("NKLeft")
end
end

Rect2:addEventListener ("touch", pressLeft)
Knifebbox : addEventListener ("tap", LeftB)




return localGroup
end