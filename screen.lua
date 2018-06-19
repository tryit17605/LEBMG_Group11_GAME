display.setStatusBar(display.HiddenStatusBar)
local composer = require("composer")
local scene = composer.newScene()

function scene:create( event )
    bk = display.newImageRect("bkt.png",720,1280)
    bk.alpha=0
    bk.y = display.contentHeight/2
    bk.x = display.contentWidth/2
    transition.to(bk,{time=2000,alpha=1})
    local buttonStart = display.newRoundedRect(150,750,170,150,0.1)
    buttonStart:setFillColor(1,0,0)
    buttonStart.alpha=0.01
    local function buttonStartEv (event)
        composer.gotoScene("screengame")
    end
    buttonStart:addEventListener("touch",buttonStartEv)
end


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )


return scene
