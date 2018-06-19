display.setStatusBar(display.HiddenStatusBar)
local composer = require("composer")
local scenegame = composer.newScene()

function step0()
    bk = display.newImageRect("game.png",720,1280)
    bk.y = display.contentHeight/2
    bk.x = display.contentWidth/2
    bkshadow = display.newRoundedRect(display.contentWidth/2,display.contentHeight/2,720,1280,0)
    bkshadow:setFillColor(0,0,0,0.5)
    blackhole = display.newImageRect("blackhole.png",450,800)
    blackhole.x = display.contentWidth/2
    blackhole.y = display.contentHeight/2
    blackhole.alpha = 0
    transition.to(blackhole,{time=1000,alpha=1})
    transition.to(blackhole, { rotation=-135, time=9000, transition=easing.inOutCubic } )
    transition.to(blackhole, { time=3000,xScale=1.4,yScale=1.4} )
    btnmenu = display.newImageRect("menu.png",120,110)
    btnmenu.x = 620
    btnmenu.y = 100
    btncollect = display.newImageRect("collect.png",120,120)
    btncollect.x = 620
    btncollect.y = 1205
    npc = display.newImageRect("npc.png",590,125)
    npc.x = 290
    npc.y = 1170
    npc.alpha = 0
    npctext = display.newText("有新的元素呢...",display.contentWidth/2 - 128 ,1168,native.systemFont, 48)
    npctext.alpha = 0
    btncollect.alpha = 0
    function showtext()
        transition.to(btncollect,{time=1000,alpha=1})
        transition.to(npc,{time=1000,alpha=1})
        transition.to(npctext,{time=1500,alpha=1})
    end
    btncollecthide = display.newImageRect("collect.png",120,120)
    btncollecthide.x = 622
    btncollecthide.y = 1209
    btncollecthide.alpha=0
    timer.performWithDelay(1800,showtext)
    function showcollect()
        npc.alpha = 0
        npctext.alpha=0
        showbox = display.newImageRect("show.png",720,1280)
        showbox.x = display.contentWidth/2
        showbox.y = display.contentHeight/2 -30
        fire = display.newImageRect("fire.png",200,200)
        fire.x = display.contentWidth/2 + 20
        fire.y = display.contentHeight/2 + 110
        fire.alpha=1
        water = display.newImageRect("water.png",190,190)
        water.x = display.contentWidth/2 + 20
        water.y = display.contentHeight/2 + 400
        water.alpha=1
        mud = display.newImageRect("mud.png",200,200)
        mud.x = display.contentWidth/2 - 210
        mud.y = display.contentHeight/2 + 110
        mud.alpha=1
        tree = display.newImageRect("tree.png",200,200)
        tree.x = display.contentWidth/2 -210
        tree.y = display.contentHeight/2 + 400
        tree.alpha=1
        btncollect.alpha=0
        btncollecthide.alpha=1
        function hide()
            display.remove(showbox)
            display.remove(close)
            display.remove(fire)
            display.remove(mud)
            display.remove(tree)
            display.remove(water)
            btncollecthide.alpha=0
            btncollect.alpha=1
            npc.alpha=1
            npctext.alpha=1
        end 
        close = display.newImageRect("close.png",65.1,55.5)
        close.x = display.contentWidth/2 - 320
        close.y = display.contentHeight/2 - 65
        close:addEventListener("touch",hide)
        local boolfire = 0
        local boolwater = 0
        local boolmud = 0
        local booltree = 0
        function selectfire()
            if boolmud == 1 then
                step1("fire")
            else
                fire.alpha = 0.6
                mud.alpha = 1
                boolfire = 1
                tree.alpha = 0.2
                water.alpha = 0.2
            end
        end
        function selectwater()
            if boolmud == 1 then
                step1("water")
            else
                water.alpha = 0.6
                mud.alpha = 1
                boolwater = 1
                tree.alpha = 0.2
                fire.alpha = 0.2
            end
        end
        function selecttree()
            if boolmud == 1 then
                step1("tree")
            else
                tree.alpha = 0.6
                mud.alpha = 1
                booltree = 1
                fire.alpha = 0.2
                water.alpha = 0.2
            end
        end
        function selectmud()
            if boolfire == 1 then
                step1("fire")
            elseif boolwater == 1 then
                step1("water")
            elseif booltree == 1 then
                step1("tree")
            else
                mud.alpha = 0.6
                mud.alpha = 1
                boolmud = 1
                tree.alpha = 1
                water.alpha = 1
            end
        end
        fire:addEventListener("touch",selectfire)
        mud:addEventListener("touch",selectmud)
        tree:addEventListener("touch",selecttree)
        water:addEventListener("touch",selectwater)
    end
    btncollect:addEventListener("touch",showcollect)
end 

function step1(selector)
    display.remove(blackhole)
    display.remove(showbox)
    display.remove(close)
    display.remove(fire)
    display.remove(mud)
    display.remove(tree)
    display.remove(water)
    display.remove(btncollecthide)
    display.remove(btncollect)
    btncollect = display.newImageRect("nc.png",120,120)
    btncollect.x = 620
    btncollect.y = 1205
    display.remove(npctext)
    npctext = display.newText("發生變化了呢...",display.contentWidth/2 - 128 ,1168,native.systemFont, 48)
    npctext.alpha = 0
    transition.to(npc,{time=2000,alpha=1})
    transition.to(npctext,{time=2500,alpha=1})
    bkshadow:setFillColor(0,0,0,0)
    wtf = display.newImageRect("combine.png",45,80)
    wtf.y = display.contentHeight/2
    wtf.x = display.contentWidth/2
    transition.to(wtf, { time=1000,xScale=12,yScale=12} )
    local function combine() 
        transition.to(wtf, { rotation=-10, time=500, transition=easing.inOutCubic } )
    end
    transition.to(wtf, { rotation=10, time=1500, transition=easing.inOutCubic } )
    timer.performWithDelay(1250,combine)
    timer.performWithDelay(6000,transition.to(wtf, { alpha=0, time=6000} ))
    local function changet()
        npctext.text = "疑？這是什麼..."
    end
    timer.performWithDelay(3000,changet)
    local function loadearth()
        stepearth(selector)
    end
    timer.performWithDelay(6000,loadearth)
end

function stepearth(s)
    display.remove(wtf)
    if s == "fire" then 
        local function changet()
            npctext.text = "原來是生氣星..."
        end
        timer.performWithDelay(500,changet)
        fearth = display.newImageRect("fireearth.png",1,1)
    elseif s=="water"then
        local function changet()
            npctext.text = "原來是哭泣星..."
        end
        timer.performWithDelay(500,changet)
        fearth = display.newImageRect("riverearth.png",1,1)
    else
        local function changet()
            npctext.text = "原來是開心星..."
        end
        timer.performWithDelay(500,changet)
        fearth = display.newImageRect("treearth.png",1,1)
    end
    fy,fx = display.contentHeight,display.contentWidth 
    fearth.y = fy/2
    fearth.x = fx/2
    transition.to(fearth, { time=300,xScale=720,yScale=1280} )
    local reverse = 1
    local function runiiiit()
        if (reverse == 0) then
            reverse = 1
            transition.to(fearth, { y=fy/2-20, time=500, transition=easing.inOutCubic } )
        else
            reverse = 0
            transition.to(fearth, { y=fy/2+20, time=500, transition=easing.inOutCubic } )
        end
    end
    display.remove(btncollect)
    btncollect = display.newImageRect("collect.png",120,120)
    btncollect.x = 620
    btncollect.y = 1205
    local n0p = 0
    local n1p = 0
    local n3p = 0
    local n4p = 0
    local n2p = 0
    local function changebool(numb)
        if numb == 1 then
            n1p = n1p + 1
        elseif numb == 2 then
            n2p = n2p + 1
        elseif numb == 3 then
            n3p = n3p + 1
        elseif numb == 4 then
            n4p = n4p + 1
        elseif numb == 0 then
            n0p = n0p + 1
        end

    end
    local function showitem()
        local function zoomout(pic)
            zoom = display.newImageRect("zoom.png",720,1280)
            zoom.x = display.contentWidth/2
            zoom.y = display.contentHeight/2
            zoomitem = display.newImageRect(pic,300,300)
            zoomitem.x = display.contentWidth/2
            zoomitem.y = display.contentHeight/2 + 70
            local function delayrm()
                display.remove(zoom)
                display.remove(zoomitem)
            end
            zoom:addEventListener("touch",delayrm)
        end
        if n0p > 0 then
            p0 = display.newImageRect("0pic.png",120,120)
            p0.x = 200
            p0.y = 637
            function zoomo()
                zoomout('0pic.png')
            end
            p0:addEventListener("touch",zoomo)
        end
        if n1p > 0 then
            p1 = display.newImageRect("1pic.png",120,120)
            p1.x = 361
            p1.y = 642
            function zoomo()
                zoomout('1pic.png')
            end
            p1:addEventListener("touch",zoomo)
        end
        if n2p > 0 then
            p2 = display.newImageRect("2pic.png",120,120)
            p2.x = 522
            p2.y = 639
            function zoomo()
                zoomout('2pic.png')
            end
            p2:addEventListener("touch",zoomo)
        end
        if n3p > 0 then
            p3 = display.newImageRect("3pic.png",120,120)
            p3.x = 200
            p3.y = 793
            function zoomo()
                zoomout('3pic.png')
            end
            p3:addEventListener("touch",zoomo)
        end
        if n4p > 0 then
            p4 = display.newImageRect("4pic.png",120,120)
            p4.x = 361
            p4.y = 793
            function zoomo()
                zoomout('4pic.png')
            end
            p4:addEventListener("touch",zoomo)
        end

    end
    local function warning()
        ww = display.newImageRect("ww.png",1,1)
        ww.x = display.contentWidth/2 + 150
        ww.y = display.contentHeight/2 - 150
        transition.to(ww,{time=500,xScale=120,yScale=120})
        local function loaditem()
            num = math.random(0,4)
            numpic = tostring(num) .. 'pic.png'
            getbkg = display.newImageRect("get.png",720,1280)
            item = display.newImageRect(numpic,300,300)
            getbkg.x = display.contentWidth/2 
            getbkg.y = display.contentHeight/2
            item.x = display.contentWidth/2 
            item.y = display.contentHeight/2 + 70
            display.remove(ww)
            changebool(num)
            local function del() 
                transition.to(item,{time=1000,xScale=0.01,yScale=0.01})
                display.remove(item)
                display.remove(getbkg)
                delaynum = math.random(3000,15000)
                wt = timer.performWithDelay(delaynum,warning)
            end
            timer.performWithDelay(2000,del)
            fearth:removeEventListener("touch",loaditem)
        end
        fearth:addEventListener("touch",loaditem)
    end 
    delaynum = math.random(3000,15000)
    wt = timer.performWithDelay(delaynum,warning)
    local function showall()
        display.remove(allcat)
        allcat = display.newImageRect("all.png",720,1280)
        allcat.x = display.contentWidth/2 
        allcat.y = display.contentHeight/2
        closecat = display.newImageRect("close.png",100,80)
        closecat.x = 88
        closecat.y = 429
        timer.pause(wt)
        showitem()
        btncollect:removeEventListener("touch",showall)
        local function closecatf()
            btncollect:addEventListener("touch",showall)
            display.remove(allcat)
            display.remove(closecat)
            display.remove(p1)
            display.remove(p2)
            display.remove(p0)
            display.remove(p3)
            display.remove(p4)
            timer.resume(wt)
        end
        closecat:addEventListener("touch",closecatf)
    end
    btncollect:addEventListener("touch",showall)
    timer.performWithDelay(600,runiiiit,0)
end 

function scenegame:create(event)
    step0()
end

scenegame:addEventListener("create",scenegame)
scenegame:addEventListener("show",scenegame)

return scenegame
