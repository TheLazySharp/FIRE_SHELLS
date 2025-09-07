function loadPause()
    Game.commandes = false
    groupPause = myGUI.newGroup()
    pauseTitle =
        myGUI.newText(
        screenW / 2 - 300,
        screenH / 2 - 320,
        600,
        50,
        "PAUSE",
        fontTitle,
        "center",
        "center",
        255,
        255,
        255
    )
    pausePanel = myGUI.newPanel(screenW / 2 - 300, screenH / 2 - 350, 600, 700)
    stopPauseButton = myGUI.newButton(screenW / 2 - 125, 300, 250, 40, "REPRENDRE", fontTitleText, 255, 255, 255)
    commandsButton = myGUI.newButton(screenW / 2 - 125, 350, 250, 40, "COMMANDES", fontTitleText, 255, 255, 255)
    quitGameButton = myGUI.newButton(screenW / 2 - 125, 400, 250, 40, "QUITTER LA PARTIE", fontTitleText, 255, 255, 255)

    closePauseButton =
        myGUI.newButton(screenW / 2 + 295 - 50, screenH / 2 - 320, 20, 20, "", fontTitleText, 255, 255, 255)
    closeCommandsButton =
        myGUI.newButton(screenW / 2 + 295 - 50, screenH / 2 - 320, 20, 20, "", fontTitleText, 255, 255, 255)

    groupPause:addElement(pausePanel)
    groupPause:addElement(pauseTitle)
    groupPause:addElement(stopPauseButton)
    groupPause:addElement(quitGameButton)
    groupPause:addElement(closePauseButton)
    groupPause:addElement(commandsButton)
    groupPause:addElement(closeCommandsButton)

    closeButtonDefault = love.graphics.newImage("images/CLOSE_1.png")
    closeButtonHover = love.graphics.newImage("images/CLOSE_2.png")
    closeButtonPressed = love.graphics.newImage("images/CLOSE_3.png")
    closeCommandsButtonDefault = love.graphics.newImage("images/CLOSE_1.png")
    closeCommandsButtonHover = love.graphics.newImage("images/CLOSE_2.png")
    closeCommandsButtonPressed = love.graphics.newImage("images/CLOSE_3.png")

    upCommand = love.graphics.newImage("images/COMMAND_UP.png")
    downCommand = love.graphics.newImage("images/COMMAND_DOWN.png")
    leftCommand = love.graphics.newImage("images/COMMAND_L.png")
    rightCommand = love.graphics.newImage("images/COMMAND_R.png")
    escCommand = love.graphics.newImage("images/COMMAND_ESC.png")
    spaceCommand = love.graphics.newImage("images/COMMAND_SPACE.png")
    dCommand = love.graphics.newImage("images/COMMAND_D.png")
    qCommand = love.graphics.newImage("images/COMMAND_Q.png")
    zCommand = love.graphics.newImage("images/COMMAND_Z.png")

    pausePanel:setImages(love.graphics.newImage("images/PANEL_MENU_.png"))
    closePauseButton:setImages(closeButtonDefault, closeButtonHover, closeButtonPressed)
    closeCommandsButton:setImages(closeCommandsButtonDefault, closeCommandsButtonHover, closeCommandsButtonPressed)

    pausePanel.visible = true
    pauseTitle.visible = true
    stopPauseButton.visible = true
    quitGameButton.visible = true
    closePauseButton.visible = true
    commandsButton.visible = true
    closeCommandsButton.visible = false

    function onResumePressed(pState)
        if stopPauseButton.visible then
            Game.pause = false
            print("game resumed")
        end
    end
    stopPauseButton:setEvent("pressed", onResumePressed)

    function onQuitPressed(pState)
        if quitGameButton.visible then
            Game.state = GameStates.title
            --loadTitle()
            Game.pause = false
            print("come back to menu")
        end
    end
    quitGameButton:setEvent("pressed", onQuitPressed)

    function onClosePressed(pState)
        if closePauseButton.visible then
            Game.pause = false
            print("game resumed")
        end
    end
    closePauseButton:setEvent("pressed", onClosePressed)

    function onCommandsPressed(pState)
        if commandsButton.visible then
            Game.commandes = true
            print("show commands on pause")
        end
    end
    commandsButton:setEvent("pressed", onCommandsPressed)

    function onCloseCommandsPressed(pState)
        if closeCommandsButton.visible then
            Game.commandes = false
            print("hide commands on pause")
        end
    end
    closeCommandsButton:setEvent("pressed", onCloseCommandsPressed)
end
function updatePause(dt)
    if Game.pause then
        groupPause.visible = true
    else
        groupPause.visible = false
    end

    groupPause:update(dt)
end
function drawPause()
    groupPause:draw()

    if Game.commandes then
        pauseTitle.visible = false
        stopPauseButton.visible = false
        quitGameButton.visible = false
        closePauseButton.visible = false
        commandsButton.visible = false
        closeCommandsButton.visible = true

        local yCmd = 140
        local yTxt = 160
        local interCmd = 60
        love.graphics.setFont(fontInGame)
        love.graphics.draw(upCommand, screenW / 2 - 270, yCmd)
        love.graphics.print("avancer", screenW / 2 - 100, yTxt)
        love.graphics.draw(downCommand, screenW / 2 - 270, yCmd + 1 * interCmd)
        love.graphics.print("reculer", screenW / 2 - 100, yTxt + 1 * interCmd)
        love.graphics.draw(leftCommand, screenW / 2 - 270, yCmd + 2 * interCmd)
        love.graphics.print("pivoter en sens anti horaire", screenW / 2 - 100, yTxt + 2 * interCmd)
        love.graphics.draw(rightCommand, screenW / 2 - 270, yCmd + 3 * interCmd)
        love.graphics.print("pivoter en sens horaire", screenW / 2 - 100, yTxt + 3 * interCmd)
        love.graphics.draw(qCommand, screenW / 2 - 270, yCmd + 4 * interCmd)
        love.graphics.print("pivoter le canon en sens anti horaire", screenW / 2 - 100, yTxt + 4 * interCmd)
        love.graphics.draw(dCommand, screenW / 2 - 270, yCmd + 5 * interCmd)
        love.graphics.print("pivoter le canon en sens horaire", screenW / 2 - 100, yTxt + 5 * interCmd)
        love.graphics.draw(zCommand, screenW / 2 - 270, yCmd + 6 * interCmd)
        love.graphics.print("recentrer le canon", screenW / 2 - 100, yTxt + 6 * interCmd)
        love.graphics.draw(spaceCommand, screenW / 2 - 245, yCmd + 7 * interCmd)
        love.graphics.print("tirer", screenW / 2 - 100, yTxt + 7 * interCmd)
        love.graphics.draw(escCommand, screenW / 2 - 270, yCmd + 8 * interCmd)
        love.graphics.print("pause", screenW / 2 - 100, yTxt + 8 * interCmd)
    else
        pauseTitle.visible = true
        stopPauseButton.visible = true
        quitGameButton.visible = true
        closePauseButton.visible = true
        commandsButton.visible = true
        closeCommandsButton.visible = false
    end
end
