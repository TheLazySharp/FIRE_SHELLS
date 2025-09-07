function initPlay()
    ListSprites = {}
    ShellFire = {}
    Rounds = {}

    --sounds set to nil to avoid multiple loading
    LootSound = nil
    HerosHit = nil
    SmallExpl = nil
    MoovingHeros = nil
    BossArrival = nil
    SpawnMob = nil
    MobShot = nil
    BossShot = nil
    MobDead = nil
    GameOverSound = nil
    OpeningSound = nil
    VictorySound = nil
    DemolishedSound = nil
    HitMobSound = nil
    Desk = nil

    ImgShellFire = nil

    droping = 0
    reloading = 0
    WAREHOUSE_OPENING = 0

    gameoverTimer = 0
    gameoverTimerWork = false -- cooldown before gameover scene
    victoryTimer = 0
    victoryTimerWork = false -- cooldown before gameover scene
    timerBoss = 0
    timerBossWork = false

    SPAWN_TIMER = 4 -- SPAWN_TIMER is increased at the begining of the game
    NB_IA = 0 --IA counter
    NB_FRAG = 0 --FRAG counter
    SPAWN_DELAY = 5 -- time between ennemies spwans
    TOTAL_IA = TOTAL_IA -- amount of IA to kill to let the boss appears
    MAX_N_IA = MAX_N_IA -- max amount of IA simultaenously on screen
    HEROS_AMMO = HEROS_AMMO
    SHELL_DMG = 25
    SHELL_V = SHELL_V
    ROUND_MOB_DMG = 5
    ROUND_MOB_V = 150
    ROUND_BOSS_DMG = 10
    ROUND_BOSS_V = ROUND_BOSS_V
    BOSS_COOLDOWN = 3
    MOB_COOLDOWN = 1
    HEROS_COOLDOWN = 0.5 -- cooldown for Heros reloading
    MOB_MAX_LIFE = MOB_MAX_LIFE
    BOSS_MAX_LIFE = BOSS_MAX_LIFE
    BOSS_RANGE = 800
    BOSS_RANGE_SHOT = 500
    BOSS_TIMER_ARRIVAL = 4

    -- LISTE DES ETATS DE LA MAE

    local IASTATES = {}
    IASTATES.NONE = ""
    IASTATES.WALK = "walk"
    IASTATES.ATTACK = "attack"
    IASTATES.CHANGEDIR = "change"
    IASTATES.CHANGEAFTERCOLLIDE = "collide"
    IASTATES.SHOOT = "shoot"
    IASTATES.ARRIVAL = "arrival"

    function createSprite(pList, pType, pImageFile, pNFrames)
        local newSprite = {}
        newSprite.type = pType
        newSprite.visible = true
        newSprite.images = {}
        newSprite.currentFrame = 1
        newSprite.suppr = false

        local i
        for i = 1, pNFrames do
            local fileName = "images/" .. pImageFile .. tostring(i) .. ".png"

            newSprite.images[i] = love.graphics.newImage(fileName)
        end

        newSprite.x = 0
        newSprite.y = 0
        newSprite.vx = 0
        newSprite.vy = 0

        newSprite.w = newSprite.images[1]:getWidth()
        newSprite.h = newSprite.images[1]:getHeight()

        table.insert(pList, newSprite)

        return newSprite
    end

    function createHeros()
        Heros = {}
        Heros = createSprite(ListSprites, "heros", "TANK_", 3)
        Heros.x = 50
        Heros.y = screenH / 2
        Heros.ox = Heros.w / 2
        Heros.oy = Heros.h / 2
        Heros.angle = 0
        Heros.engine = false
        Heros.i = math.rad(90)
        Heros.v = 0
        Heros.g = 0.01
        Heros.vx = 0
        Heros.vy = 0
        Heros.shellavailable = true
        Heros.maxlife = 100
        Heros.life = Heros.maxlife
        Heros.ammo = HEROS_AMMO
        Heros.hurt = function()
            Heros.life = Heros.life - 0 -- faire un lien avec les DMG infligés par les ennemis
            if Heros.life <= 0 then
                Heros.life = 0
                Heros.visible = false
            end
        end
        Heros.zones = {}
        table.insert(Heros.zones, {r = Heros.h / 2, offx = 0, offy = 0})
        table.insert(Heros.zones, {r = Heros.h / 2, offx = 15, offy = 0})
        table.insert(Heros.zones, {r = Heros.h / 2, offx = -10, offy = 0})

        print("heros created")
        return Heros
    end

    function createHerosGun()
        HerosGun = {}
        HerosGun = createSprite(ListSprites, "gun", "GUN_", 1)
        HerosGun.x = Heros.x
        HerosGun.y = Heros.y
        HerosGun.ox = 6
        HerosGun.oy = HerosGun.h / 2
        HerosGun.angle = Heros.angle
        HerosGun.i = Heros.i
        HerosGun.rotate = false
        HerosGun.fire = false
        HerosGun.visible = true
        return HerosGun
    end

    function createBossGun1()
        BossGun1 = {}
        BossGun1 = createSprite(ListSprites, "gun1", "BOSS_GUN_", 1)
        BossGun1.visible = false
        return BossGun1
    end

    function createBossGun2()
        BossGun2 = {}
        BossGun2 = createSprite(ListSprites, "gun2", "BOSS_GUN_", 1)
        BossGun2.visible = false
        return BossGun2
    end

    function createBossWrhse()
        BossWrhse = {}
        BossWrhse = createSprite(ListSprites, "bosswarehouse", "BOSS_WRHSE_", 9)
        BossWrhse.x = screenW
        BossWrhse.y = screenH / 2 + BossWrhse.h / 2
        BossWrhse.angle = math.rad(180)
        BossWrhse.visible = true
        BossWrhse.opening = false
        BossWrhse.open = false
        BossWrhse.close = true
        print("boss warehouse generated")
        return BossWrhse
    end

    function createIA(pX, pY, pAngle, pTypeIA, pImIA, pFrameIA)
        local newIA = createSprite(ListSprites, pTypeIA, pImIA, pFrameIA)
        newIA.x = pX
        newIA.y = pY
        newIA.ox = newIA.w / 2
        newIA.oy = newIA.h / 2
        newIA.v = math.random(0.5, 0.9)
        newIA.i = 90
        newIA.target = "heros"
        if newIA.type == "boss" then
            newIA.range = 0
        else
            newIA.range = math.random(300, 450)
        end
        if newIA.type == "boss" then
            newIA.rangeShot = 0
        else
            newIA.rangeShot = math.random(200, 300)
        end

        newIA.angle = pAngle
        if newIA.type == "mob" then
            newIA.maxlife = MOB_MAX_LIFE
        else
            newIA.maxlife = BOSS_MAX_LIFE
        end
        newIA.life = newIA.maxlife
        newIA.state = IASTATES.NONE
        newIA.roundavailable = false
        newIA.IAreloading = 0
        newIA.zones = {}
        table.insert(newIA.zones, {r = newIA.h / 2, offx = 0, offy = 0})
        table.insert(newIA.zones, {r = newIA.h / 2, offx = 10, offy = 0})
        table.insert(newIA.zones, {r = newIA.h / 2, offx = -10, offy = 0})
        if newIA.type == "boss" then
            table.insert(newIA.zones, {r = newIA.h / 2, offx = 20, offy = 0})
            table.insert(newIA.zones, {r = newIA.h / 2, offx = -20, offy = 0})
        end
        return newIA
    end

    function createExplosion(exX, exY, exOX, exOY, exAngle)
        local newExplosion = createSprite(ListSprites, "explosion", "EXPLO_", 5)
        newExplosion.x = exX
        newExplosion.y = exY
        newExplosion.ox = exOX
        newExplosion.oy = exOY
        newExplosion.angle = 0
        newExplosion.visible = true
        SmallExpl:play()
        return newExplosion
    end

    function createSmokeExp(exX, exY, exOX, exOY)
        local SmokeExpl = createSprite(ListSprites, "smokeexplosion", "SMOKE_EXPL_", 4)
        SmokeExpl.x = exX
        SmokeExpl.y = exY
        SmokeExpl.ox = exOX
        SmokeExpl.oy = exOY
        SmokeExpl.angle = 0
        SmokeExpl.visible = true
        --SmallExpl:play()
        return SmokeExpl
    end

    function createSmoke(exX, exY, exOX, exOY)
        local Smoke = createSprite(ListSprites, "smoke", "SMOKE_", 5)
        Smoke.x = exX
        Smoke.y = exY
        Smoke.visible = true
        return Smoke
    end

    function dropShellBox(xBox, yBox, oxBox, oyBox)
        local ShellBox = createSprite(ListSprites, "shellbox", "SHELL_BOX_", 1)
        ShellBox.x = xBox
        ShellBox.y = yBox
        ShellBox.ox = oxBox
        ShellBox.oy = oyBox
        ShellBox.angle = 0
        ShellBox.visible = false
        return ShellBox
    end

    function dropLife(xLife, yLife, oxLife, oyLife)
        local HeartLife = createSprite(ListSprites, "life", "LIFE_", 1)
        HeartLife.x = xLife
        HeartLife.y = yLife
        HeartLife.ox = oxLife
        HeartLife.oy = oyLife
        HeartLife.angle = 0
        HeartLife.visible = false

        return HeartLife
    end

    function lootShellBox()
        Heros.ammo = Heros.ammo + 10
        reloading = 0
        LootSound:play()
    end

    function lootLife()
        Heros.life = Heros.life + 20
        if Heros.life >= Heros.maxlife then
            Heros.life = Heros.maxlife
        end
        LootSound:play()
    end

    local ShellLoad = createSprite(ListSprites, "shellload", "SHELL_LOAD_", 9)
    ShellLoad.x = 65
    ShellLoad.y = screenH - 70
    ShellLoad.visible = false
    local ShellFull = createSprite(ListSprites, "shellfull", "SHELL_FULL_", 2)
    ShellFull.x = 65
    ShellFull.y = screenH - 70
    ShellFull.visible = false
    local ShellEmpty = createSprite(ListSprites, "shellempty", "SHELL_EMPTY_", 2)
    ShellEmpty.x = 65
    ShellEmpty.y = screenH - 70
    ShellEmpty.visible = false

    dangerPanel = createSprite(ListSprites, "dangerpanel", "DANGER_", 2)
    dangerPanel.visible = false

    function createWarehouseOpen()
        warehouseOpen = {}
        warehouseOpen = createSprite(ListSprites, "warehouseopen", "WRHSE_OPEN_", 1)
        warehouseOpen.x = screenW
        warehouseOpen.y = screenH / 2 + warehouseOpen.h / 2
        warehouseOpen.visible = true
        return warehouseOpen
    end

    Spawnlocation = {}
    Spawnlocation.im1 = love.graphics.newImage("images/WRHSE1.png")
    Spawnlocation.im2 = love.graphics.newImage("images/WRHSE2.png")
    Spawnlocation.im3 = love.graphics.newImage("images/WRHSE3.png")
    Spawnlocation.x1 = screenW - 220
    Spawnlocation.y1 = screenH / 2 - 96
    Spawnlocation.ang1 = 180
    Spawnlocation.x2 = screenW - 100
    Spawnlocation.y2 = screenH - 64
    Spawnlocation.ang2 = 180
    Spawnlocation.x3 = screenW - 100
    Spawnlocation.y3 = 64
    Spawnlocation.ang3 = 180

    -- collisions contre les mobs
    local sprite1
    local sprite2
    function testcollision(sprite1, sprite2)
        local x1
        local x2
        local y1
        local y2
        for k1, zone1 in ipairs(sprite1.zones) do
            for k2, zone2 in ipairs(sprite2.zones) do
                x1 = sprite1.x + zone1.offx * math.cos(sprite1.angle)
                y1 = sprite1.y + zone1.offx * math.sin(sprite1.angle)
                x2 = sprite2.x + zone2.offx * math.cos(sprite2.angle)
                y2 = sprite2.y + zone2.offx * math.sin(sprite2.angle)
                if sprite1.type == "round1" then
                    x1 = sprite1.x + 15 + zone1.offx * math.cos(sprite1.angle)
                    y1 = sprite1.y - (37 - BossGun2.h / 2) + zone1.offx * math.sin(sprite1.angle)
                end
                if sprite1.type == "round2" then
                    x1 = sprite1.x + 15 + zone1.offx * math.cos(sprite1.angle)
                    y1 = sprite1.y - (1 - BossGun1.h / 2) + zone1.offx * math.sin(sprite1.angle)
                end
                if CircleIntersect(x1, y1, zone1.r, x2, y2, zone2.r) then
                    return true
                end
            end
        end
        return false
    end

    function TestcollisionMap()
        function ifHitEdges()
            Heros.v = -Heros.v * deceleration
            Heros.v = -Heros.v * deceleration
            Heros.life = Heros.life - dmgshock
        end

        deceleration = 0.2
        rebond = 0
        dmgshock = 0

        -- rebond sur les bords de l'écran

        -- en haut
        if Heros.y <= Heros.h / 2 and Heros.v > 0 then
            ifHitEdges()
            Heros.y = Heros.h / 2 + rebond
        end

        -- en bas
        if Heros.y >= screenH - Heros.h / 2 and Heros.v > 0 then
            ifHitEdges()
            Heros.y = screenH - Heros.h / 2 - rebond
        end

        -- a gauche
        if Heros.x <= Heros.h / 2 and Heros.v > 0 then
            ifHitEdges()
            Heros.x = Heros.h / 2 + rebond
        end

        -- a droite
        if Heros.x >= screenW - Heros.h / 2 and Heros.v > 0 then
            ifHitEdges()
            Heros.x = screenW - Heros.h / 2 - rebond
        end
    end

    -- =============================================
    --------------- MACHINE A ETAT -------------------
    -- =============================================

    function updateIA(pIA, pEntities)
        if pIA.type == "boss" then
            if pIA.visible then
                BossGun1.x = pIA.x
                BossGun1.y = pIA.y
                BossGun1.ox = 19
                BossGun1.oy = 1
                BossGun1.angle = pIA.angle
                BossGun1.visible = pIA.visible
                BossGun1.fire = pIA.fire

                BossGun2.x = pIA.x
                BossGun2.y = pIA.y
                BossGun2.ox = 19
                BossGun2.oy = 37
                BossGun2.angle = pIA.angle
                BossGun2.visible = pIA.visible
                BossGun2.fire = pIA.fire
                --pIA.roundavailable = false
                pIA.state = IASTATES.ARRIVAL
            end
        end

        local disttotarget = math.dist(pIA.x, pIA.y, Heros.x, Heros.y)
        if Heros.visible == false then
            pIA.state = IASTATES.CHANGEDIR
        elseif pIA.state == nil then
            pIA.state = IASTATES.NONE
        elseif pIA.state == IASTATES.NONE then
            pIA.state = IASTATES.CHANGEDIR
        else
            -- AFTER COLLIDE
            -- CHANGE DIR
            if pIA.state == IASTATES.ARRIVAL then
                if pIA.x >= screenW - 150 then
                    pIA.angle = math.rad(180)
                    pIA.x = pIA.x - pIA.v
                else
                    pIA.state = IASTATES.CHANGEDIR
                    pIA.range = BOSS_RANGE
                    pIA.rangeShot = BOSS_RANGE_SHOT
                end
            end
            if pIA.state == IASTATES.CHANGEDIR then
                pIA.v = 0.5
                local destx = math.random(0, screenW)
                local desty = math.random(0, screenW)
                local destangle = math.angle(pIA.x, pIA.y, destx, desty)
                local force_x = math.cos(destangle) * pIA.v * 60
                local force_y = math.sin(destangle) * pIA.v * 60
                pIA.vx = force_x
                pIA.vy = force_y
                pIA.angle = destangle
                pIA.state = IASTATES.WALK
            end

            -- WALK

            if pIA.state == IASTATES.WALK then
                local bCollide = false
                if pIA.x < pIA.w / 2 then
                    pIA.x = pIA.w / 2
                    bCollide = true
                end

                if pIA.y < pIA.w / 2 then
                    pIA.y = pIA.w / 2
                    bCollide = true
                end

                if pIA.x > screenW - pIA.w / 2 then
                    pIA.x = screenW - pIA.w / 2
                    bCollide = true
                end

                if pIA.y > screenH - pIA.w / 2 then
                    pIA.y = screenH - pIA.w / 2
                    bCollide = true
                end
                if bCollide then
                    pIA.state = IASTATES.CHANGEDIR
                end
                if disttotarget <= pIA.range then
                    pIA.state = IASTATES.ATTACK
                end
            end

            -- ATTACK

            if pIA.state == IASTATES.ATTACK --[[and pIA.collision == false]] then
                pIA.v = 1
                local destx = Heros.x
                local desty = Heros.y
                local destangle = math.angle(pIA.x, pIA.y, destx, desty)
                local force_x = math.cos(destangle) * pIA.v * 60
                local force_y = math.sin(destangle) * pIA.v * 60
                pIA.vx = force_x
                pIA.vy = force_y
                pIA.angle = destangle

                if disttotarget <= pIA.rangeShot then
                    pIA.state = IASTATES.SHOOT
                elseif disttotarget > pIA.range then
                    pIA.state = IASTATES.CHANGEDIR
                end
            end

            -- SHOOT des mobs
            if pIA.state == IASTATES.SHOOT --[[and pIA.collision == false]] then
                pIA.fire = false
                pIA.v = 0
                local destx = Heros.x
                local desty = Heros.y
                local destangle = math.angle(pIA.x, pIA.y, destx, desty)
                local force_x = math.cos(destangle)
                local force_y = math.sin(destangle)
                pIA.vx = 0
                pIA.vy = 0
                pIA.angle = destangle

                if pIA.type == "mob" then
                    if pIA.roundavailable then
                        pIA.fire = true
                        local Round = createSprite(ListSprites, "round", "ROUND_", 1)
                        MobShot:play()
                        Round.visible = true
                        Round.x = pIA.x
                        Round.y = pIA.y
                        Round.v = ROUND_MOB_V
                        Round.angle = pIA.angle
                        local force_x = math.cos(pIA.angle) * Round.v
                        local force_y = math.sin(pIA.angle) * Round.v
                        Round.vx = Round.vx + force_x
                        Round.vy = Round.vy + force_y
                        Round.ox = Round.w / 2
                        Round.oy = Round.h / 2
                        Round.dmg = ROUND_MOB_DMG
                        Round.zones = {}
                        table.insert(Round.zones, {r = Round.h / 2, offx = 0, offy = 0})
                        table.insert(Round.zones, {r = Round.h / 2, offx = 3, offy = 0})
                        table.insert(Round.zones, {r = Round.h / 2, offx = -3, offy = 0})
                        pIA.roundavailable = false
                    end
                end

                if pIA.type == "boss" then
                    if pIA.roundavailable then
                        BossGun1.fire = true
                        BossShot:play()
                        local Round1 = createSprite(ListSprites, "round1", "ROUND_", 1)
                        Round1.visible = true
                        Round1.x = BossGun1.x
                        Round1.y = BossGun1.y
                        Round1.v = ROUND_BOSS_V
                        Round1.angle = pIA.angle
                        local force_x = math.cos(BossGun1.angle) * Round1.v
                        local force_y = math.sin(BossGun1.angle) * Round1.v
                        Round1.vx = Round1.vx + force_x
                        Round1.vy = Round1.vy + force_y
                        Round1.ox = 19
                        Round1.oy = 3 - BossGun1.h / 2
                        Round1.dmg = ROUND_BOSS_DMG
                        Round1.zones = {}

                        table.insert(Round1.zones, {r = Round1.h / 2, offx = 0, offy = 0})
                        table.insert(Round1.zones, {r = Round1.h / 2, offx = 3, offy = 0})
                        table.insert(Round1.zones, {r = Round1.h / 2, offx = -3, offy = 0})
                        print("BOSS FIRE " .. Round1.type)

                        BossGun2.fire = true
                        local Round2 = createSprite(ListSprites, "round2", "ROUND_", 1)
                        Round2.visible = true
                        Round2.x = BossGun2.x
                        Round2.y = BossGun2.y
                        Round2.v = ROUND_BOSS_V
                        Round2.angle = pIA.angle
                        local force_x = math.cos(BossGun2.angle) * Round2.v
                        local force_y = math.sin(BossGun2.angle) * Round2.v
                        Round2.vx = Round2.vx + force_x
                        Round2.vy = Round2.vy + force_y
                        Round2.ox = 19
                        Round2.oy = 39 - BossGun1.h / 2
                        Round2.dmg = ROUND_BOSS_DMG
                        Round2.zones = {}
                        table.insert(Round2.zones, {r = Round2.h / 2, offx = 0, offy = 0})
                        table.insert(Round2.zones, {r = Round2.h / 2, offx = 3, offy = 0})
                        table.insert(Round2.zones, {r = Round2.h / 2, offx = -3, offy = 0})
                        print("BOSS FIRE " .. Round2.type)
                        pIA.roundavailable = false
                    end
                end

                if disttotarget > pIA.rangeShot then
                    pIA.state = IASTATES.ATTACK
                end
            end
        end
    end
    print("Play init ok")
end

function loadPlay()
    initPlay()

    Heros = createHeros()
    HerosGun = createHerosGun()
    BossWrhse = createBossWrhse()

    if ImgShellFire == nil then
        ImgShellFire = love.graphics.newImage("images/SHELL_FIRE.png")
    end
    if Desk == nil then
        Desk = love.graphics.newImage("images/DESK.png")
    end

    if LootSound == nil then
        LootSound = love.audio.newSource("sounds/ohyeah.wav", "static")
    end
    if HerosHit == nil then
        HerosHit = love.audio.newSource("sounds/aie.wav", "static")
    end
    if SmallExpl == nil then
        SmallExpl = love.audio.newSource("sounds/smallexplosion.wav", "static")
    end
    if MoovingHeros == nil then
        MoovingHeros = love.audio.newSource("sounds/mooving.wav", "static")
    end
    if BossArrival == nil then
        BossArrival = love.audio.newSource("sounds/ohnohescoming.wav", "static")
    end
    if SpawnMob == nil then
        SpawnMob = love.audio.newSource("sounds/spawn.wav", "static")
    end
    if MobShot == nil then
        MobShot = love.audio.newSource("sounds/pa.wav", "static")
    end
    if BossShot == nil then
        BossShot = love.audio.newSource("sounds/tata.wav", "static")
    end
    if MobDead == nil then
        MobDead = love.audio.newSource("sounds/oneless.wav", "static")
    end
    if GameOverSound == nil then
        GameOverSound = love.audio.newSource("sounds/gameover.wav", "static")
    end
    if OpeningSound == nil then
        OpeningSound = love.audio.newSource("sounds/opening.wav", "static")
    end
    if VictorySound == nil then
        VictorySound = love.audio.newSource("sounds/victory.wav", "static")
    end
    if DemolishedSound == nil then
        DemolishedSound = love.audio.newSource("sounds/demolished.wav", "static")
    end
    if HitMobSound == nil then
        HitMobSound = love.audio.newSource("sounds/hit.wav", "static")
    end

    ShellFire.w = ImgShellFire:getWidth()
    ShellFire.h = ImgShellFire:getHeight()
end

function updatePlay(dt)
    HerosGun.x = Heros.x
    HerosGun.y = Heros.y
    if Heros.visible then
        HerosGun.visible = true
    else
        HerosGun.visible = false
    end

    if Heros.suppr then
        HerosGun.suppr = true
    end

    -- Animation des sprites selons leurs frame

    local i
    for i, sprite in ipairs(ListSprites) do
        if sprite.type ~= "shellload" and sprite.type ~= "bosswarehouse" then
            sprite.currentFrame = sprite.currentFrame + 0.1

            if sprite.currentFrame > #sprite.images + 1 then
                sprite.currentFrame = 1
            end
        end

        sprite.x = sprite.x + sprite.vx * dt
        sprite.y = sprite.y + sprite.vy * dt
    end

    -- MOUVEMENTS DU HEROS

    if love.keyboard.isDown("left") then
        Heros.angle = Heros.angle - Heros.i * dt
        HerosGun.x = Heros.x
        HerosGun.y = Heros.y
        if Heros.angle <= 0 then
            Heros.angle = 2 * math.pi
        end
        if HerosGun.rotate == false then
            HerosGun.angle = Heros.angle
        end
    end

    if love.keyboard.isDown("right") then
        Heros.angle = Heros.angle + Heros.i * dt
        HerosGun.x = Heros.x
        HerosGun.y = Heros.y
        if Heros.angle >= 2 * math.pi then
            Heros.angle = 0
        end
        if HerosGun.rotate == false then
            HerosGun.angle = Heros.angle
        end
    end

    if love.keyboard.isDown("up") then
        Heros.engine = true
        if Heros.collision then
            Heros.v = 0
        else
            Heros.v = 100
            MoovingHeros:play()
        end
        local angleRadian = Heros.angle
        local force_x = math.cos(angleRadian) * Heros.v * dt
        local force_y = math.sin(angleRadian) * Heros.v * dt
        Heros.x = Heros.x + force_x
        Heros.y = Heros.y + force_y
        Heros.vx = force_x
        Heros.vy = force_y
        HerosGun.x = Heros.x
        HerosGun.y = Heros.y
    elseif love.keyboard.isDown("down") then
        Heros.v = 50
        local angleRadian = Heros.angle
        local force_x = math.cos(angleRadian) * Heros.v * dt
        local force_y = math.sin(angleRadian) * Heros.v * dt
        Heros.x = Heros.x - force_x
        Heros.y = Heros.y - force_y
        HerosGun.x = Heros.x
        HerosGun.y = Heros.y
    end

    if love.keyboard.isDown("q") then
        HerosGun.angle = HerosGun.angle - HerosGun.i * dt
        HerosGun.rotate = true
        HerosGun.ox = 6
        HerosGun.oy = HerosGun.h / 2

        if HerosGun.angle <= 0 then
            HerosGun.angle = 2 * math.pi
        end
    end

    if love.keyboard.isDown("d") then
        HerosGun.angle = HerosGun.angle + HerosGun.i * dt
        HerosGun.rotate = true
        HerosGun.ox = 6
        HerosGun.oy = HerosGun.h / 2
        if HerosGun.angle >= 2 * math.pi then
            HerosGun.angle = 0
        end
    end

    -- création des IA ennemies

    SPAWN_TIMER = SPAWN_TIMER + dt
    for nIA = 1, 10 do
        if SPAWN_TIMER > SPAWN_DELAY and NB_IA < MAX_N_IA and TOTAL_IA > 0 then
            local spawnNb = math.random(1, 6)
            if spawnNb == 1 or spawnNb == 4 then
                pX = Spawnlocation.x1
                pY = Spawnlocation.y1
                pAngle = Spawnlocation.ang1
            elseif spawnNb == 2 or spawnNb == 5 then
                pX = Spawnlocation.x2
                pY = Spawnlocation.y2
                pAngle = Spawnlocation.ang2
            elseif spawnNb == 3 or spawnNb == 6 then
                pX = Spawnlocation.x3
                pY = Spawnlocation.y3
                pAngle = Spawnlocation.ang3
            end
            createIA(pX, pY, pAngle, "mob", "MOB_", 3)
            SpawnMob:play()
            SPAWN_TIMER = 0
            NB_IA = NB_IA + 1
            TOTAL_IA = TOTAL_IA - 1
        elseif NB_IA == MAX_N_IA or TOTAL_IA <= 0 then
            SPAWN_TIMER = 0
        end
    end

    -- TEST COLLISION ENTRE MOBS ET HEROS --

    local i

    for i, sprites in ipairs(ListSprites) do
        if sprites.type == "heros" or sprites.type == "mob" or sprites.type == "boss" then
            sprites.collision = false
        end
        local s1
        local s2
        local sprite1
        local sprite2

        for s1 = 1, #ListSprites - 1 do
            sprite1 = ListSprites[s1]
            for s2 = s1 + 1, #ListSprites do
                sprite2 = ListSprites[s2]

                if
                    (sprite1.type == "heros" or sprite1.type == "mob" or sprite1.type == "boss") and
                        (sprite2.type == "heros" or sprite2.type == "mob" or sprite2.type == "boss")
                 then
                    if s1 ~= s2 then
                        if testcollision(sprite1, sprite2) then
                            sprite1.collision = true
                            sprite2.collision = true
                        end
                    end
                end
            end
        end
    end

    TestcollisionMap()

    -- update des IA et délais rechargement des munitions ennemies
    local i
    for i, sprite in ipairs(ListSprites) do
        if sprite.type == "mob" or sprite.type == "boss" then
            updateIA(sprite, ListSprites)

            if sprite.type == "mob" then
                if sprite.roundavailable == false then
                    sprite.IAreloading = sprite.IAreloading + dt
                    if sprite.IAreloading > MOB_COOLDOWN then
                        sprite.roundavailable = true
                        sprite.IAreloading = 0
                    end
                end
            elseif sprite.type == "boss" then
                if sprite.roundavailable == false then
                    sprite.IAreloading = sprite.IAreloading + dt
                    if sprite.IAreloading > BOSS_COOLDOWN then
                        sprite.roundavailable = true
                        sprite.IAreloading = 0
                    end
                end
            end
        end
    end

    -- marquer les tirs qui sortent de l'écran
    local i
    for i = #ListSprites, 1, -1 do
        local shot = ListSprites[i]
        if shot.type == "shell" or shot.type == "round" or shot.type == "round1" or shot.type == "round2" then
            if shot.x > screenW or shot.x < 0 or shot.y < 0 or shot.y > screenH then
                shot.suppr = true
                shot.visible = false
            end
        end
    end

    -- supprimer les sprites marqués et les tirs

    local i
    for i = #ListSprites, 1, -1 do
        local sprite = ListSprites[i]
        if sprite.suppr == true then
            table.remove(ListSprites, i)
            print("" .. sprite.type .. " suppr")
        end
    end

    -- test de hit entre obus amis et ennemis
    local s
    local m
    for s = #ListSprites, 1, -1 do
        sh = ListSprites[s]
        if sh.type == "shell" then
            for m = #ListSprites, 1, -1 do
                sprite = ListSprites[m]
                if sprite.type == "mob" or sprite.type == "boss" then
                    if testcollision(sh, sprite) then
                        sh.suppr = true
                        sh.visible = false
                        createExplosion(sh.x, sh.y, sh.w / 2, sh.h / 2, sh.angle)
                        HitMobSound:play()
                        sprite.life = sprite.life - sh.dmg
                        sh.dmg = 0
                    end
                end
            end
        end
    end

    -- test de hit entre round ennemis et le héros
    local s
    local m
    for s = #ListSprites, 1, -1 do
        rnd = ListSprites[s]
        if rnd.type == "round" or rnd.type == "round1" or rnd.type == "round2" then
            for m = #ListSprites, 1, -1 do
                sprite = ListSprites[m]
                if sprite.type == "heros" then
                    if testcollision(rnd, sprite) then
                        rnd.suppr = true
                        rnd.visible = false
                        createExplosion(rnd.x, rnd.y, rnd.ox, rnd.oy, rnd.angle)
                        sprite.life = sprite.life - rnd.dmg
                        HerosHit:play()
                        rnd.dmg = 0
                    end
                end
            end
        end
    end

    -- explosion des sprite détruits

    for m, sprite in ipairs(ListSprites) do
        if sprite.type == "mob" or sprite.type == "heros" or sprite.type == "boss" then
            if sprite.life <= 0 then
                sprite.life = 0
                sprite.visible = false
                createExplosion(sprite.x, sprite.y, sprite.ox, sprite.oy, sprite.angle)

                if sprite.type == "mob" then
                    MobDead:play()
                    NB_FRAG = NB_FRAG + 1
                    NB_IA = NB_IA - 1
                    if Heros.ammo <= 8 then
                        dropShellBox(sprite.x, sprite.y, sprite.ox, sprite.oy)
                    elseif Heros.life <= Heros.maxlife * 0.25 then
                        dropLife(sprite.x, sprite.y, sprite.ox, sprite.oy)
                    else
                        dropShellBox(sprite.x, sprite.y, sprite.ox, sprite.oy)
                    end
                end
                sprite.suppr = true
            end
        end
    end

    -- ARRIVEE DU BOSS
    if TOTAL_IA == 0 and NB_IA == 0 then
        OpeningSound:play()

        BossWrhse.opening = true
        BossWrhse.open = false
        BossWrhse.close = false
        dangerPanel.visible = true
        dangerPanel.x = screenW / 2 - dangerPanel.w / 2
        dangerPanel.y = screenH / 2 - dangerPanel.h / 2
        timerBossWork = true
        WAREHOUSE_OPENING = WAREHOUSE_OPENING + dt

        if WAREHOUSE_OPENING >= BOSS_TIMER_ARRIVAL then
            BossWrhse.opening = false
            BossWrhse.open = true
            BossWrhse.close = false
            timerBossWork = false
            WAREHOUSE_OPENING = 0
            BossArrival:play()
            createIA(screenW, screenH / 2, 180, "boss", "BOSS_", 4)
            createBossGun1()
            createBossGun2()
            TOTAL_IA = -1
            dangerPanel.visible = false

            createWarehouseOpen()
        end
    end

    -- BOSS BATTU

    local i, sprite
    for i = #ListSprites, 1, -1 do
        sprite = ListSprites[i]
        if sprite.type == "boss" then
            if sprite.life <= 0 then
                sprite.life = 0
                sprite.visible = false
                sprite.suppr = true
                createExplosion(sprite.x, sprite.y, sprite.ox, sprite.oy, sprite.angle)
                victoryTimerWork = true
                BossGun1.suppr = true
                BossGun2.suppr = true
                LootSound:play()
            end
        end
    end
    if victoryTimerWork then
        victoryTimer = victoryTimer + dt
        if victoryTimer >= 2 then
            victoryTimerWork = false
            Game.state = GameStates.victory
            VictorySound:play()
            print("" .. Game.state)
        end
    end

    -- gestion de la destruction du heros et game over

    if Heros.life <= 0 then
        Heros.life = 0
        Heros.visible = false
        Heros.suppr = true
        GameOverSound:play()
        gameoverTimerWork = true
        if gameoverTimerWork then
            gameoverTimer = gameoverTimer + dt
            if gameoverTimer >= 2 then
                gameoverTimerWork = false
                Game.state = GameStates.gameover
                print("" .. Game.state)
            end
        end
    end

    -- compteur avant dropshellbox
    local box
    for box, sprite in ipairs(ListSprites) do
        if sprite.type == "shellbox" or sprite.type == "life" then
            if sprite.visible == false then
                local dropTime = 1 -- délais drop de la box
                droping = droping + dt
                if droping > dropTime then
                    sprite.visible = true
                    droping = 0
                end
            end
        end
    end

    -- Loot des Shell Box et des Life
    local lootbox
    for lootbox, sprite in ipairs(ListSprites) do
        if sprite.type == "shellbox" then
            if sprite.visible then
                local loot = math.dist(Heros.x, Heros.y, sprite.x, sprite.y)
                if loot < 35 then
                    lootShellBox()
                    sprite.visible = false
                    sprite.suppr = true
                end
            end
        end
    end

    local lootheart
    for lootheart, sprite in ipairs(ListSprites) do
        if sprite.type == "life" then
            if sprite.visible then
                local loot = math.dist(Heros.x, Heros.y, sprite.x, sprite.y)
                if loot < 35 then
                    lootLife()
                    sprite.visible = false
                    sprite.suppr = true
                end
            end
        end
    end

    -- compteur de disponibilités des shell

    if Heros.shellavailable == false then
        reloading = reloading + dt
        if reloading > HEROS_COOLDOWN and Heros.ammo > 0 then
            Heros.shellavailable = true
        end
    end

    local i
    for i, sprite in ipairs(ListSprites) do
        if sprite.type == "shellfull" or sprite.type == "shellload" or sprite.type == "shellempty" then
            if Heros.ammo > 0 then
                if sprite.type == "shellempty" then
                    sprite.visible = false
                end
                if sprite.type == "shellfull" then
                    if Heros.shellavailable == false then
                        sprite.visible = false
                    else
                        sprite.visible = true
                    end
                end

                if sprite.type == "shellload" then
                    if Heros.shellavailable then
                        sprite.visible = false
                        sprite.currentFrame = 1
                    else
                        sprite.visible = true
                        if
                            reloading >= sprite.currentFrame / #sprite.images * HEROS_COOLDOWN and
                                sprite.currentFrame < #sprite.images + 1
                         then
                            sprite.currentFrame = sprite.currentFrame + 1
                        end
                    end
                end
            elseif Heros.ammo == 0 then
                if sprite.type == "shellfull" or sprite.type == "shellload" then
                    sprite.visible = false
                end
                if sprite.type == "shellempty" then
                    sprite.visible = true
                end
            end
        end
    end

    -- boss warehouse opening  then
    local i
    for i, sprite in ipairs(ListSprites) do
        if sprite.type == "bosswarehouse" then
            if BossWrhse.close then
                --sprite.currentFrame = 1
            elseif BossWrhse.open then
                sprite.currentFrame = 9
            elseif BossWrhse.opening then
                --sprite.currentFrame = 1
                if
                    WAREHOUSE_OPENING >= sprite.currentFrame / #sprite.images * BOSS_TIMER_ARRIVAL and
                        sprite.currentFrame < #sprite.images + 1
                 then
                    sprite.currentFrame = sprite.currentFrame + 1
                    if sprite.currentFrame == 9 then
                        sprite.opening = false
                        sprite.open = true
                    end
                end
            end
        end
    end

    -- mettre fin à l'explosion
    local i
    for i, sprite in ipairs(ListSprites) do
        if sprite.type == "explosion" or sprite.type == "smokeexplosion" then
            local frame = sprite.images[math.floor(sprite.currentFrame)]
            if frame == sprite.images[#sprite.images] then
                sprite.visible = false
                sprite.suppr = true
            end
        end
    end

    function drawHitCircles(sprite)
        if
            sprite.type == "heros" or sprite.type == "mob" or sprite.type == "boss" or sprite.type == "shell" or
                sprite.type == "round" or
                sprite.type == "round1" or
                sprite.type == "round2"
         then
            for k, v in ipairs(sprite.zones) do
                local x = sprite.x + v.offx * math.cos(sprite.angle)
                local y = sprite.y + v.offx * math.sin(sprite.angle)
                love.graphics.circle("line", x, y, v.r)
            end
        end
    end
end
function drawPlay()
    love.graphics.setFont(fontPlay)

    -- Tank screen for ammo
    love.graphics.draw(Desk, 0, screenH - 80)

    love.graphics.setBackgroundColor(love.math.colorFromBytes(255, 255, 255))
    -- affichage des warehouses
    love.graphics.draw(
        Spawnlocation.im1,
        Spawnlocation.x1,
        Spawnlocation.y1,
        math.rad(Spawnlocation.ang1),
        1,
        1,
        Spawnlocation.im1:getWidth() / 2,
        Spawnlocation.im1:getHeight() / 2
    )
    love.graphics.draw(
        Spawnlocation.im2,
        Spawnlocation.x2,
        Spawnlocation.y2,
        math.rad(Spawnlocation.ang2),
        1,
        1,
        Spawnlocation.im2:getWidth() / 2,
        Spawnlocation.im2:getHeight() / 2
    )
    love.graphics.draw(
        Spawnlocation.im3,
        Spawnlocation.x3,
        Spawnlocation.y3,
        math.rad(Spawnlocation.ang3),
        1,
        1,
        Spawnlocation.im3:getWidth() / 2,
        Spawnlocation.im3:getHeight() / 2
    )

    -- affichage des sprites

    local i
    for i, sprite in ipairs(ListSprites) do
        if
            sprite.visible and sprite.type ~= "heros" and sprite.type ~= "gun" and sprite.type ~= "boss" and
                sprite.type ~= "gun1" and
                sprite.type ~= "gun2" and
                sprite.type ~= "mob" and
                sprite.type ~= "shell" and
                sprite.type ~= "round" and
                sprite.type ~= "round1" and
                sprite.type ~= "round2"
         then
            local frame = sprite.images[math.floor(sprite.currentFrame)]
            love.graphics.draw(frame, sprite.x, sprite.y, sprite.angle, 1, 1, sprite.ox, sprite.oy)

            -- debug hitcircles
            if love.keyboard.isDown("h") then
                if sprite.collision then
                    love.graphics.setColor(love.math.colorFromBytes(1, 162, 232))
                    drawHitCircles(sprite)
                else
                    love.graphics.setColor(love.math.colorFromBytes(255, 1, 1))
                    drawHitCircles(sprite)
                    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
                end
            end

            love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
            if sprite.fire then
                love.graphics.draw(
                    ImgShellFire,
                    sprite.x,
                    sprite.y,
                    sprite.angle,
                    1,
                    1,
                    sprite.ox - sprite.w,
                    sprite.oy - sprite.h / 2 + ShellFire.h / 2
                )
            end
            --love.graphics.setColor(love.math.colorFromBytes(1, 1, 1))

            -- debug MEA
            if sprite.type == "mob" or sprite.type == "boss" then
                if love.keyboard.isDown("w") then
                    love.graphics.setColor(love.math.colorFromBytes(1, 1, 1))
                    love.graphics.print(sprite.state, sprite.x + 40, sprite.y)
                    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
                end
            end

            -- debug tile position
            -- if sprite.type == "mob" or sprite.type == "boss" then
            --     if love.keyboard.isDown("t") then
            --         love.graphics.print(sprite.col .. " / " .. sprite.line, sprite.x + 40, sprite.y)
            --     end
            -- end

            love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
        end
    end

    --love.graphics.pop()

    --Debug
    love.graphics.setColor(love.math.colorFromBytes(1, 1, 1))
    local sDebug = "Debug : "
    sDebug = sDebug .. " delai ouverture wrhse : " .. WAREHOUSE_OPENING
    --love.graphics.print(sDebug, 0, 0)
    love.graphics.setFont(fontInGame)

    if Heros.ammo <= 5 then
        love.graphics.setColor(love.math.colorFromBytes(255, 1, 1))
    else
        love.graphics.setColor(love.math.colorFromBytes(1, 1, 1))
    end
    if Heros.ammo < 10 then
        love.graphics.print("" .. Heros.ammo, 77, screenH - 30)
    else
        love.graphics.print("" .. Heros.ammo, 72, screenH - 30)
    end
    love.graphics.setColor(love.math.colorFromBytes(1, 1, 1))
    love.graphics.print("Fuel", 108, screenH - 40)
    love.graphics.print("FRAGS", 10, screenH - 40)
    love.graphics.print(NB_FRAG, 25, screenH - 20)

    if Heros.life <= Heros.maxlife / 2 then
        love.graphics.setColor(love.math.colorFromBytes(255, 1, 1))
    else
        love.graphics.setColor(love.math.colorFromBytes(1, 1, 1))
    end
    love.graphics.print("" .. Heros.life, 115, screenH - 20)

    love.graphics.setColor(love.math.colorFromBytes(1, 1, 1))
    love.graphics.setFont(fontDefault)
    --love.graphics.print("[" .. myMaps.col .. "] / [" .. myMaps.lin .. "] / ", 0, 60)
    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
end
