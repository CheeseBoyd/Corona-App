local composer = require("composer")
local scene = composer.newScene()
local background
local width = display.contentWidth
local height = display.contentHeight

local function goTogame()
    composer.gotoScene( "scene.game", { effect = "slideDown", params = { } })
end

function scene:create( event )
  local sceneGroup = self.view -- add display objects to this group
  background = display.newImageRect( "background.png", width, height )
  background.x = display.contentCenterX
  background.y = display.contentCenterY
  background:addEventListener( "tap", goTogame )
  print("scene created")  
end

  background = display.newImageRect( "background.png", width, height )
  background.x = display.contentCenterX
  background.y = display.contentCenterY
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        Runtime:addEventListener("enterFrame")   
        print("screen ready")
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
    print("screen deploy")
    end
end

function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    background:removeEventListener("tap")
end


return scene