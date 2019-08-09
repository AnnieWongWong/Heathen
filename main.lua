



-- SCENE CHANGE / SPLASH SCREEN CODE BY PEACH PELLEN   http://techority.com/2010/11/19/how-to-use-scenesscreens-in-corona/ 



local director = require ("director")
local mainGroup = display.newGroup()

local function main()

	mainGroup :insert(director.directorView)
	director:changeScene("home")
return true
end

main()
