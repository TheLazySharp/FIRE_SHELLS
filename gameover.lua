function loadGameover()
    groupGameover = myGUI.newGroup()
    titleGameover =
        myGUI.newText(screenW / 2 - 150, 50, 300, 80, "GAME OVER", fontTitle, "center", "center", 255, 255, 255)

    menuButton =
        myGUI.newButton(screenW / 2 - 150, screenH / 2, 300, 40, "RETOUR AU MENU", fontTitleText, 255, 255, 255)
    quitButton = myGUI.newButton(screenW / 2 - 150, screenH / 2 + 50, 300, 40, "QUITTER", fontTitleText, 255, 255, 255)

    groupGameover:addElement(menuButton)
    groupGameover:addElement(quitButton)
    menuButton.visible = true
    quitButton.visible = true

    groupGameover:addElement(titleGameover)

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
function updateGameover(dt)
    groupGameover:update(dt)
end
function drawGameover()
    love.graphics.setBackgroundColor(love.math.colorFromBytes(1, 1, 1))
    groupGameover:draw()
end
function love.keypressed(key)
end
