module(..., package.seeall)

function new()
local localGroup = display.newGroup()

local bkg = display.newImage ("wbkg.jpg")
localGroup:insert(bkg)



return localGroup
end