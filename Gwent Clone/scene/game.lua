--Make this a scene

local physics = require("physics")
local width = display.contentWidth
local height = display.contentHeight

local background = display.newImageRect( "background.png", width, height )
background.x = display.contentCenterX
background.y = display.contentCenterY

local balloon = display.newImageRect( "balloon.png", 200, 200 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8

local platform = display.newImageRect("platform.png", width, 200)
platform.x = display.contentCenterX
platform.y = display.contentCenterY + 700

physics.start()
physics.addBody( platform, "static" )
physics.addBody( balloon, "dynamic", { radius=50, bounce=0.3 } )

local function pushBalloon()
    balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
end
 
balloon:addEventListener( "tap", pushBalloon )