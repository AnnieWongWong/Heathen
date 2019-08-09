module(..., package.seeall)

function new()
local localGroup = display.newGroup()


-- background pic
local bkg = display.newImage ("pics/rsz_blk.jpg",240,160)
localGroup:insert(bkg)




back = display.newText("Back", 20, 25, "font/prin.ttf", 27)
back:setFillColor(1,.843137,0)
localGroup:insert(back)


-- Back button (by Peach Pellen http://techority.com/2010/11/19/how-to-use-scenesscreens-in-corona/ )
local function pressback (event)
	if event.phase == "ended" then
	director:changeScene ("home")
end
end

back:addEventListener ("touch", pressback)


--instruction text
instructions = display.newText("Objective", 240, 50, "font/prin.ttf", 35)
instructions:setFillColor(1,.843137,0)
localGroup:insert(instructions)

instructionss = display.newText("This is a basic choose your own path game. \nTo win you must get out of the cave alive.\nAnd to get out alive you must choose the \n'better' choice of the two options that will\n pop up throughout the game.", 1, 120, "font/Serena.ttf", 25)
instructionss.anchorX=0
instructionss.anchorY=0
instructionss:setFillColor(1,.843137,0)
localGroup:insert(instructionss)




return localGroup
end