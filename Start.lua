module(..., package.seeall)

function new()
local localGroup = display.newGroup()

local bkg = display.newImage ("rsz_wbkg.jpg", 240, 180 )
localGroup:insert(bkg)




return localGroup
end