function loadVictory()
    groupVictory = myGUI.newGroup()
    titleVictory =
        myGUI.newText(screenW / 2 - 150, 50, 300, 80, "VICTOIRE !!", fontTitle, "center", "center", 255, 255, 255)

    menuButton =
        myGUI.newButton(screenW / 2 - 150, screenH / 2, 300, 40, "RETOUR AU MENU", fontTitleText, 255, 255, 255)
    quitButton = myGUI.newButton(screenW / 2 - 150, screenH / 2 + 50, 300, 40, "QUITTER", fontTitleText, 255, 255, 255)

    groupVictory:addElement(menuButton)
    groupVictory:addElement(quitButton)
    menuButton.visible = true
    quitButton.visible = true

    groupVictory:addElement(titleVictory)

    function onRetourPressed(pState)
        if menuButton.visible then
            playButton.visible = false
            quitMenuButton.visible = false
            settingsButton.visible = false
            commandButton.visible = false
            MenuTimerWork = true
            Game.state = GameStates.menu
            loadMenu()
            print("" .. Game.state)
            print("On Menu button is pressed :" .. pState)
        end
    end

    function onQuitPressed(pState)
        love.event.quit()
    end

    menuButton:setEvent("pressed", onRetourPressed)
    quitButton:setEvent("pressed", onQuitPressed)
end
function updateVictory(dt)
    groupVictory:update(dt)
end
function drawVictory()
    love.graphics.setBackgroundColor(love.math.colorFromBytes(1, 1, 1))
    groupVictory:draw()
end
function love.keypressed(key)
end
