-- MenuTimerWork = true
-- local buttonTimer = 0

function loadTuto()
    groupTuto = myGUI.newGroup()
    settingsPanel = myGUI.newPanel(screenW / 2 - 300, screenH / 2 - 350, 600, 700)
    playButton = myGUI.newButton(screenW / 2 - 40, 660, 80, 40, "OK", fontTitleText, 255, 255, 255)
    commandsTitle =
        myGUI.newText(
        screenW / 2 - 300,
        screenH / 2 - 320,
        600,
        50,
        "COMMANDES",
        fontTitle,
        "center",
        "center",
        255,
        255,
        255
    )
    groupTuto:addElement(settingsPanel)
    groupTuto:addElement(playButton)
    groupTuto:addElement(commandsTitle)

    upCommand = love.graphics.newImage("images/COMMAND_UP.png")
    downCommand = love.graphics.newImage("images/COMMAND_DOWN.png")
    leftCommand = love.graphics.newImage("images/COMMAND_L.png")
    rightCommand = love.graphics.newImage("images/COMMAND_R.png")
    escCommand = love.graphics.newImage("images/COMMAND_ESC.png")
    spaceCommand = love.graphics.newImage("images/COMMAND_SPACE.png")
    dCommand = love.graphics.newImage("images/COMMAND_D.png")
    qCommand = love.graphics.newImage("images/COMMAND_Q.png")
    zCommand = love.graphics.newImage("images/COMMAND_Z.png")

    settingsPanel:setImages(love.graphics.newImage("images/PANEL_MENU_.png"))

    playButton.visible = true
    settingsPanel.visible = true
    commandsTitle.visible = true

    function onPlayPressed(pState)
        if playButton.visible then
            Game.state = GameStates.play
            print("On play button is pressed :" .. pState)
            print("" .. Game.state)
            myMaps.load()
            loadPlay()
        end
    end

    playButton:setEvent("pressed", onPlayPressed)

    print("load commands before game")
end
function updateTuto(dt)
    groupTuto:update(dt)
end
function drawTuto()
    --love.graphics.setBackgroundColor(love.math.colorFromBytes(255, 255, 255))

    groupTuto:draw()

    local yCmd = 120
    local yTxt = 140
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
end
