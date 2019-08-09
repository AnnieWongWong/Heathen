module(..., package.seeall)

function new()
local localGroup = display.newGroup()


--dialogue

local text = {"The  old man leads you to another crevice in a wall", "After helping him through, you also enter the next room", "OLD MAN : There, that's the exit across this lake", "Suddenly the old man stops talking and seems to be thinking about something",
"He pulls out a knife and aims for you head","OLD MAN : I'd rather die than help you out of this cave, after all you had\n to think twice before saving me!","You and the old man fight","If only you had a weapon than maybe you could fight back",
"He manages to slash you and you fall to the ground","OLD MAN : hhahhahahahahaha", "OLD MAN : thanks for saving me :)",""}

--background art by Raphael Lacoste https://www.artstation.com/artist/raphael-lacoste

bkg = display.newImage("pics/rsz_raph.jpg",250,130);
localGroup:insert(bkg)


hp = display.newText("HP : 97", 35,30,"font/Bucket.ttf",30)
hp : setFillColor (0.862745, 0.0784314, 0.235294)
localGroup:insert(hp)


--Quit button (self Created)

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


-- Initial Text

A = display.newText("", 20,230,"font/Sere.ttf",25)
A:setFillColor(0.254902, 0.411765, 0.882353)
A.anchorX=0
A.anchorY=0
localGroup:insert(A)




--Options pop up (Self Created code)
a=1
local function change()
	if (a>=1) and (a<=#text) then
	A.text=text[a]
	a=a+1
end
	if (a==10) then
		hp.text = "HP :  0"
end
	if (a == #text+1 ) then
  director:changeScene ("DieBye")
	end
end 

box:addEventListener("tap", change)



return localGroup
end
