function loadTitle()
    FireShells = love.audio.newSource("sounds/title.wav", "static")

    titleTimer = 0
    titleTimerWork = true
    ImgShell = nil
    print("" .. Game.state)
    if ImgShell == nil then
        ImgShell = love.graphics.newImage("images/SHELL_TITLE.png")
    end

    groupTitle = myGUI.newGroup()

    credit =
        myGUI.newText(
        screenW / 2 - 150,
        screenH / 2 - 40,
        300,
        80,
        "LAZY SHARP",
        fontTitle,
        "center",
        "center",
        255,
        255,
        255
    )
    underCredit =
        myGUI.newText(
        screenW / 2 - 200,
        screenH / 2 - 40 + 40,
        400,
        80,
        "PRESENTS",
        fontTitle,
        "center",
        "center",
        255,
        255,
        255
    )
    title =
        myGUI.newText(
        screenW / 2 - 150,
        screenH / 2 - 40,
        300,
        80,
        "FIRE SHELLS",
        fontTitle,
        "center",
        "center",
        255,
        255,
        255
    )
    startButton = myGUI.newButton(screenW / 2 - 100, screenH / 2 + 100, 200, 40, "START", fontTitleText, 255, 255, 255)

    groupTitle:addElement(credit)
    groupTitle:addElement(underCredit)
    groupTitle:addElement(title)
    groupTitle:addElement(startButton)

    function onStartPressed(pState)
        print("On start button is pressed :" .. pState)
        Game.state = GameStates.menu
        print("" .. Game.state)
    end

    startButton:setEvent("pressed", onStartPressed)

    title.visible = false
    startButton.visible = false
    titleShell = {}
    titleShell.x = 0
    titleShell.y = screenH / 2 + 100
    titleShell.v = 0
    titleShell.visible = false

    function animationShell()
        titleShell.visible = true
        titleShell.v = 1000
        if titleShell.x >= screenW then
            titleShell.visible = false
            titleShell.x = 0
            titleShell.v = 0
        end
    end
end
function updateTitle(dt)
    groupTitle:update(dt)

    if titleTimerWork then
        titleShell.x = titleShell.x + titleShell.v * dt
        titleTimer = titleTimer + dt
        if titleTimer >= 3 then
            credit.visible = false
            underCredit.visible = false
        end
        if titleTimer >= 4 then
            title.visible = true
        end
        if titleTimer >= 4.5 and titleTimer <= 4.6 then
            animationShell()
            FireShells:play()
        end
        if titleTimer >= 6.5 then
            startButton.visible = true
            titleTimerWork = false
        end
    end
end
function drawTitle()
    love.graphics.setBackgroundColor(love.math.colorFromBytes(1, 1, 1))
    if titleShell.visible == true then
        love.graphics.draw(ImgShell, titleShell.x, titleShell.y)
    end
    groupTitle:draw()
end
