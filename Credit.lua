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
credits = display.newText("Credits", 240, 50, "font/prin.ttf", 35)
credits:setFillColor(1,.843137,0)
localGroup:insert(credits)



local artists = {"heewann kim","Mostafa Rashad "," Raphael Lacoste","Ilya Nazarov","Takuma Omichi "," Andrea Petrosino ","Moritz Burkart"}

creditss = display.newText("All background images belong to their rightful\n                            owners.", -7, 150, "font/Serena.ttf", 24)
creditss.anchorX=0  
creditss.anchorY=0
creditss:setFillColor(1,.843137,0)
localGroup:insert(creditss)




return localGroup
end