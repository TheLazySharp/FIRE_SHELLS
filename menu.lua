MenuTimerWork = true
local buttonTimer = 0

function loadMenu()
    groupMenu = myGUI.newGroup()
    titleMenu = myGUI.newText(screenW / 2 - 50, 50, 100, 80, "MENU", fontTitle, "center", "center", 255, 255, 255)

    playButton = myGUI.newButton(screenW / 2 - 150, 200, 300, 40, "NOUVELLE PARTIE", fontTitleText, 255, 255, 255)
    commandButton = myGUI.newButton(screenW / 2 - 150, 250, 300, 40, "COMMANDES", fontTitleText, 255, 255, 255)
    settingsButton = myGUI.newButton(screenW / 2 - 150, 300, 300, 40, "PARAMETRES", fontTitleText, 255, 255, 255)
    quitMenuButton = myGUI.newButton(screenW / 2 - 150, 350, 300, 40, "QUITTER", fontTitleText, 255, 255, 255)
    settingsPanel = myGUI.newPanel(screenW / 2 - 300, screenH / 2 - 350, 600, 700)
    closeSettingsButton =
        myGUI.newButton(screenW / 2 + 295 - 50, screenH / 2 - 320, 20, 20, "", fontTitleText, 255, 255, 255)

    settingsTitle =
        myGUI.newText(
        screenW / 2 - 300,
        screenH / 2 - 320,
        600,
        50,
        "PARAMETRES",
        fontTitle,
        "center",
        "center",
        255,
        255,
        255
    )
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
    settingsDifficulty =
        myGUI.newText(screenW / 2 - 270, 170, 300, 30, "DIFFICULTE", fontTitleText, "left", "center", 255, 255, 255)
    CheckBoxEasy = myGUI.newCheckbox(screenW / 2 - 270, 240, 20, 20)
    CheckBoxMedium = myGUI.newCheckbox(screenW / 2 - 270, 280, 20, 20)
    CheckBoxHard = myGUI.newCheckbox(screenW / 2 - 270, 320, 20, 20)
    easy =
        myGUI.newText(screenW / 2 - 240, CheckBoxEasy.y, 150, 30, "Bleusaille", fontInGame, "left", "", 255, 255, 255)
    medium =
        myGUI.newText(
        screenW / 2 - 240,
        CheckBoxMedium.y,
        150,
        30,
        "Cul-de-plomb",
        fontInGame,
        "left",
        "",
        255,
        255,
        255
    )
    hard = myGUI.newText(screenW / 2 - 240, CheckBoxHard.y, 150, 30, "Vétéran", fontInGame, "left", "", 255, 255, 255)

    local txt =
        "Le niveau de difficulté modifie le nombre d'ennemis, leurs résistance, le nombre de munitions disponibles et la vitesse des tirs"

    difficultyText =
        myGUI.newText(screenW / 2 - 50, CheckBoxEasy.y, 300, 300, txt, fontInGame, "left", "", 255, 255, 255)

    groupMenu:addElement(playButton)
    groupMenu:addElement(settingsButton)
    groupMenu:addElement(commandButton)
    groupMenu:addElement(quitMenuButton)
    groupMenu:addElement(settingsPanel)
    groupMenu:addElement(titleMenu)
    groupMenu:addElement(closeSettingsButton)
    groupMenu:addElement(settingsTitle)
    groupMenu:addElement(settingsDifficulty)
    groupMenu:addElement(CheckBoxEasy)
    groupMenu:addElement(CheckBoxMedium)
    groupMenu:addElement(CheckBoxHard)
    groupMenu:addElement(easy)
    groupMenu:addElement(medium)
    groupMenu:addElement(hard)
    groupMenu:addElement(difficultyText)
    groupMenu:addElement(commandsTitle)

    closeSettingsButtonDefault = love.graphics.newImage("images/CLOSE_1.png")
    closeSettingsButtonHover = love.graphics.newImage("images/CLOSE_2.png")
    closeSettingsButtonPressed = love.graphics.newImage("images/CLOSE_3.png")
    easyDifficultyDefault = love.graphics.newImage("images/CHECKBOX_1.png")
    easyDifficultyPressed = love.graphics.newImage("images/CHECKBOX_2.png")
    mediumDifficultyDefault = love.graphics.newImage("images/CHECKBOX_1.png")
    mediumDifficultyPressed = love.graphics.newImage("images/CHECKBOX_2.png")
    hardDifficultyDefault = love.graphics.newImage("images/CHECKBOX_1.png")
    hardDifficultyPressed = love.graphics.newImage("images/CHECKBOX_2.png")
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
    closeSettingsButton:setImages(closeSettingsButtonDefault, closeSettingsButtonHover, closeSettingsButtonPressed)
    CheckBoxEasy:setImages(easyDifficultyDefault, easyDifficultyPressed)
    CheckBoxMedium:setImages(mediumDifficultyDefault, mediumDifficultyPressed)
    CheckBoxHard:setImages(hardDifficultyDefault, hardDifficultyPressed)

    playButton.visible = false
    settingsButton.visible = false
    commandButton.visible = false
    quitMenuButton.visible = false
    settingsPanel.visible = false
    closeSettingsButton.visible = false
    settingsTitle.visible = false
    settingsDifficulty.visible = false
    CheckBoxEasy.visible = false
    CheckBoxMedium.visible = false
    CheckBoxHard.visible = false
    easy.visible = false
    medium.visible = false
    hard.visible = false
    difficultyText.visible = false
    commandsTitle.visible = false

    Game.parametres = false
    Game.commandes = false

    function onPlayPressed(pState)
        if playButton.visible then
            Game.state = GameStates.tuto
            print("On play button is pressed :" .. pState)
            print("" .. Game.state)
        --loadPlay()
        end
    end

    function onSettingsPressed(pState)
        if settingsButton.visible then
            Game.parametres = true
        end
    end

    function onCommandPressed(pState)
        if settingsButton.visible then
            Game.commandes = true
        end
    end

    function onCloseSettingsPressed(pState)
        if closeSettingsButton.visible then
            Game.parametres = false
            Game.commandes = false
        end
    end

    function onQuitPressed(pState)
        love.event.quit()
    end

    function onEasyChecked(pState)
        TOTAL_IA = 4
        MAX_N_IA = 2
        SHELL_V = 230
        HEROS_AMMO = 30
        BOSS_MAX_LIFE = 200
        ROUND_BOSS_V = 180
        MOB_MAX_LIFE = 50
    end

    function onMediumChecked(pState)
        TOTAL_IA = 8
        MAX_N_IA = 3
        SHELL_V = 220
        HEROS_AMMO = 20
        BOSS_MAX_LIFE = 250
        ROUND_BOSS_V = 200
        MOB_MAX_LIFE = 50
    end

    function onHardChecked(pState)
        TOTAL_IA = 12
        MAX_N_IA = 3
        SHELL_V = 220
        HEROS_AMMO = 10
        BOSS_MAX_LIFE = 300
        ROUND_BOSS_V = 200
        MOB_MAX_LIFE = 75
    end

    playButton:setEvent("pressed", onPlayPressed)
    quitMenuButton:setEvent("pressed", onQuitPressed)
    settingsButton:setEvent("pressed", onSettingsPressed)
    closeSettingsButton:setEvent("pressed", onCloseSettingsPressed)
    CheckBoxEasy:setEvent("pressed", onEasyChecked)
    CheckBoxMedium:setEvent("pressed", onMediumChecked)
    CheckBoxHard:setEvent("pressed", onHardChecked)
    commandButton:setEvent("pressed", onCommandPressed)

    -- difficulty init on medium
    CheckBoxEasy:setState(false)
    CheckBoxMedium:setState(true)
    CheckBoxHard:setState(false)
    currentDifficulty = "medium"
    onMediumChecked(true)

    print("load menu ok")
end
function updateMenu(dt)
    if MenuTimerWork and Game.state == GameStates.menu then
        buttonTimer = buttonTimer + dt
        if buttonTimer >= 0.5 then
            print(buttonTimer)
            playButton.visible = true
            settingsButton.visible = true
            commandButton.visible = true
            quitMenuButton.visible = true
            MenuTimerWork = false
            buttonTimer = 0
        end
    end

    if Game.parametres then
        playButton.visible = false
        settingsButton.visible = false
        commandButton.visible = false
        quitMenuButton.visible = false
        titleMenu.visible = false
        settingsTitle.visible = true
        settingsPanel.visible = true
        closeSettingsButton.visible = true
        settingsDifficulty.visible = true
        CheckBoxEasy.visible = true
        CheckBoxMedium.visible = true
        CheckBoxHard.visible = true
        easy.visible = true
        medium.visible = true
        hard.visible = true
        difficultyText.visible = true
        commandsTitle.visible = false
    elseif Game.commandes then
        playButton.visible = false
        settingsButton.visible = false
        commandButton.visible = false
        quitMenuButton.visible = false
        titleMenu.visible = false
        settingsTitle.visible = false
        settingsPanel.visible = true
        closeSettingsButton.visible = true
        commandsTitle.visible = true
    else
        playButton.visible = true
        settingsButton.visible = true
        commandButton.visible = true
        quitMenuButton.visible = true
        titleMenu.visible = true
        settingsTitle.visible = false
        closeSettingsButton.visible = false
        settingsPanel.visible = false
        settingsDifficulty.visible = false
        CheckBoxEasy.visible = false
        CheckBoxMedium.visible = false
        CheckBoxHard.visible = false
        easy.visible = false
        medium.visible = false
        hard.visible = false
        difficultyText.visible = false
        commandsTitle.visible = false
    end

    -- Gestion des checks boxes
    if currentDifficulty == "medium" then
        if CheckBoxEasy.isPressed then
            CheckBoxEasy:setState(true)
            CheckBoxMedium:setState(false)
            CheckBoxHard:setState(false)
            currentDifficulty = "easy"
            print("" .. currentDifficulty)
        elseif CheckBoxHard.isPressed then
            CheckBoxEasy:setState(false)
            CheckBoxMedium:setState(false)
            CheckBoxHard:setState(true)
            currentDifficulty = "hard"
            print("" .. currentDifficulty)
        end
    elseif currentDifficulty == "easy" then
        if CheckBoxMedium.isPressed then
            CheckBoxEasy:setState(false)
            CheckBoxMedium:setState(true)
            CheckBoxHard:setState(false)
            currentDifficulty = "medium"
            print("" .. currentDifficulty)
        elseif CheckBoxHard.isPressed then
            CheckBoxEasy:setState(false)
            CheckBoxMedium:setState(false)
            CheckBoxHard:setState(true)
            currentDifficulty = "hard"
            print("" .. currentDifficulty)
        end
    elseif currentDifficulty == "hard" then
        if CheckBoxEasy.isPressed then
            CheckBoxEasy:setState(true)
            CheckBoxMedium:setState(false)
            CheckBoxHard:setState(false)
            currentDifficulty = "easy"
            print("" .. currentDifficulty)
        elseif CheckBoxMedium.isPressed then
            CheckBoxEasy:setState(false)
            CheckBoxMedium:setState(true)
            CheckBoxHard:setState(false)
            currentDifficulty = "medium"
            print("" .. currentDifficulty)
        end
    end

    groupMenu:update(dt)
end
function drawMenu()
    --love.graphics.setBackgroundColor(love.math.colorFromBytes(1, 1, 1))

    groupMenu:draw()
    if Game.commandes then
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
    end
end
