-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
display.setStatusBar(display.HiddenStatusBar)


local composer = require("composer")

local function run(event )
    composer.gotoScene( "screen", "fade", 1000 )
end 

run()

