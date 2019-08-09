module(..., package.seeall)

function new()


local localGroup = display.newGroup()

-- picture by Mostafa Rashad (https://www.artstation.com/artist/mmrashad)
local bkg = display.newImage ("pics/dead.jpg",240,120)
localGroup:insert(bkg)

endg = display.newText("You Have Died", 240, 40, "font/xtreem.ttf", 30)
endg:setFillColor( 0.862745, 0.0784314, 0.235294)
localGroup:insert(endg)

back = display.newText("BacktoHome", 70, 300, "font/prin.ttf", 30)
back:setFillColor(0.545098,0,0)
localGroup:insert(back)


--restart/backtohome button (Peach Pellen http://techority.com/2010/11/19/how-to-use-scenesscreens-in-corona/ )
local function pressback (event)
if event.phase == "ended" then
director:changeScene ("home")
end
end

back:addEventListener ("touch", pressback)

return localGroup
end