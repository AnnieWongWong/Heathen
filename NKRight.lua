module(..., package.seeall)

function new()
local localGroup = display.newGroup()

--dialogue

local text = {"You walk through the cave opening and into the light","All of a sudden a swarm of bats attack you",
"They aim for your eyes and just about everything else","Without a weapon to protect yourself, you suffer major injuries and fall to\n the ground",""}


--background art by Moritz Burkart  https://www.artstation.com/artist/moritzburkart

bkg= display.newImage("pics/rsz_5bats.jpg", 240,100);
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


--Text Box
box = display.newRect (240, 260, 530,90)
box : setFillColor ()
box.alpha = .7
localGroup:insert(box)

--initial text
A = display.newText("", 20,230,"font/Sere.ttf",25)
A:setFillColor(0.254902, 0.411765, 0.882353)
A.anchorX=0
A.anchorY=0
localGroup:insert(A)


--dialogue play, hp update, scene change
a=1
local function change()
	if (a>=1) and (a<=#text) then
	A.text=text[a]
	a=a+1
end
	if (a == #text-1) then
	hp.text = "HP :   0"
end	
	if (a == #text + 1 ) then 
	director:changeScene ("DieBye")
end
end
	


box:addEventListener("tap", change)






return localGroup
end