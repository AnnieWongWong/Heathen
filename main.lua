local director = require ("director")
local mainGroup = display.newGroup()

local function main()

	mainGroup :insert(director.directorView)
	director:changeScene("home")
return true
end

main()

--splashscreen = display.newImage( "wbkg.jpg", centerx,centery);
--local function removeSplash(event)
--splashscreen:removeSelf()
--splashscreen = nil
--end 
--timer.performWithDelay(9000,removeSplash)