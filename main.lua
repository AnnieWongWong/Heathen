local director = require ("director")
local mainGroup = display.newGroup()

local function main()

	mainGroup :insert(director.directorView)
	director:changeScene("home")
return true
end

main()
