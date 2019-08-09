module(..., package.seeall)

function new()
local localGroup = display.newGroup()


--dialogue

local text = {"You enter the outside world", "OLD MAN : it's nice to be outside after being stuck in there for so long", 
"You take a moment to breathe in the fresh air", "OLD MAN : im sorry....", " OLD MAN : in the time that i have been with you, you have done nothing wrong..",
 "OLD MAN : but because of your past i cannot let you live...", "He pulls a knife out of his backpack and begins to charge at you", 
 "With nothing to protect yourself you are helpless..."," You fall to the ground bleeding", "Your sight slowly fades to black", "OLD MAN : I'm sorry....",""}


--background  art by heewann kim  https://www.artstation.com/artist/heewann

bkg = display.newImage("pics/tree.jpg",250,160);
localGroup:insert(bkg)

hp = display.newText("HP :  97", 35,30,"font/Bucket.ttf",30)
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



-- Initial Text

A = display.newText("", 20,230,"font/Sere.ttf",25)
A:setFillColor(0.254902, 0.411765, 0.882353)
A.anchorX=0
A.anchorY=0
localGroup:insert(A)




a=1
local function change()
	if (a>=1) and (a<=#text) then
	A.text=text[a]
	a=a+1
end
	if (a==9) then
		hp.text = "HP :  0"
end
	if (a == #text+1 ) then
	director:changeScene ("DieBye")
	end
end 

box:addEventListener("tap", change)




return localGroup
end
