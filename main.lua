-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
  require("lldebugger").start()
end

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Retourne la distance entre deux points
function math.dist(x1, y1, x2, y2)
  return ((x2 - x1) ^ 2 + (y2 - y1) ^ 2) ^ 0.5
end

-- Renvoie l'angle entre deux vecteurs supposant la même origine.
function math.angle(x1, y1, x2, y2)
  return math.atan2(y2 - y1, x2 - x1)
end

function CheckCollision(x1, y1, w1, h1, x2, y2, w2, h2)
  return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end

function CircleIntersect(x1, y1, r1, x2, y2, r2)
  return (math.dist(x1, y1, x2, y2) <= (r1 + r2))
end

myMaps = require("maps")
myGUI = require("GUI")
require("title")
require("menu")
require("play")
require("gameover")
require("victory")
require("pause")
require("tuto")

HerosSHot = love.audio.newSource("sounds/boum.wav", "static")
clic = love.audio.newSource("sounds/clic.wav", "static")

love.window.setMode(1024, 768)

fontDefault = love.graphics.getFont()
fontTitle = love.graphics.newFont("font/FONT_ARMY.otf", 40)
fontTitleText = love.graphics.newFont("font/FONT_ARMY.otf", 30)
fontInGame = love.graphics.newFont("font/FONT_ARMY.otf", 20)
fontPlay = love.graphics.getFont()

screenW = love.graphics.getWidth() --/ 2 --si push/pop
screenH = love.graphics.getHeight() --/ 2 --si push/pop

GameStates = {}
GameStates.title = "title"
GameStates.menu = "menu"
GameStates.play = "play"
GameStates.gameover = "gameover"
GameStates.victory = "victory"
GameStates.tuto = "tuto"

Game = {}
Game.state = GameStates.title
Game.pause = false

function love.load()
  loadTitle()
  loadTuto()
  print("play load start")
  loadMenu()
  loadGameover()
  loadVictory()
  loadPause()
  --loadPlay()
end

function love.update(dt)
  if Game.state == GameStates.title then
    updateTitle(dt)
  end
  if Game.state == GameStates.gameover then
    updateGameover(dt)
  end
  if Game.state == GameStates.victory then
    updateVictory(dt)
  end
  if Game.state == GameStates.menu then
    updateMenu(dt)
  end
  if Game.state == GameStates.tuto then
    updateTuto(dt)
  end
  if Game.state == GameStates.play then
    if Game.state == GameStates.play and Game.pause then
      updatePause(dt)
      return
    end
    updatePlay(dt)
  end
end

function love.draw()
  -- love.graphics.push()
  -- love.graphics.scale(2, 2)

  if Game.state == GameStates.title then
    drawTitle()
  elseif Game.state == GameStates.play then
    myMaps.draw()
    drawPlay()
    if Game.pause then
      drawPause()
    end
  elseif Game.state == GameStates.gameover then
    drawGameover()
  elseif Game.state == GameStates.victory then
    drawVictory()
  elseif Game.state == GameStates.menu then
    drawMenu()
  elseif Game.state == GameStates.tuto then
    drawTuto()
  end

  -- love.graphics.pop()
end

function love.keypressed(key)
  if key == "tab" then -- Quit Game
    love.event.quit()
  end

  if Game.state == GameStates.play then
    if key == "escape" and Game.pause == false then
      Game.pause = true
      print("jeu en pause")
    end

    -- TIR OBUS HEROS

    if key == "space" and Heros.shellavailable and Game.pause == false and Game.state == GameStates.play then
      HerosGun.fire = true
      HerosSHot:play()
      local Shell = createSprite(ListSprites, "shell", "SHELL_", 1)
      Shell.visible = true
      Shell.y = HerosGun.y
      Shell.x = HerosGun.x
      Shell.v = SHELL_V
      local angleRadian = HerosGun.angle
      local force_x = math.cos(angleRadian) * Shell.v
      local force_y = math.sin(angleRadian) * Shell.v
      Shell.vx = Shell.vx + force_x
      Shell.vy = Shell.vy + force_y
      Shell.angle = HerosGun.angle
      Shell.ox = Shell.w / 2
      Shell.oy = Shell.h / 2
      Shell.dmg = SHELL_DMG

      reloading = 0
      Heros.shellavailable = false
      Heros.ammo = Heros.ammo - 1
      print("FIRE !")
      Shell.zones = {}
      table.insert(Shell.zones, {r = Shell.h / 2, offx = 0, offy = 0})
      table.insert(Shell.zones, {r = Shell.h / 2, offx = 3, offy = 0})
      table.insert(Shell.zones, {r = Shell.h / 2, offx = -3, offy = 0})

    --recoil effect to improve
    --Heros.x = Heros.x + math.random(-5, 5)
    --Heros.y = Heros.y + math.random(-5, 5)
    end
    if key == "z" then
      HerosGun.angle = Heros.angle
      HerosGun.rotate = false
    end
  end
end

function love.keyreleased(key)
  if key == "space" and Game.pause == false and Game.state == GameStates.play then
    HerosGun.fire = false
  end
end
