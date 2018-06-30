-- made by Asalle

require("win")
require("play")
require("splash")

lg = love.graphics

STATE_SPLASH, STATE_PLAY, STATE_WIN = 0, 1, 2
gamestates = {[0]=splash, [1]=play, [2]=win}

IMAGE_FILES = {
"splash", "cross",  "round",  "splash",  "red",  "yellow"
}

img = {}
tileh = 32

function love.load()
	love.window.setMode(480, 480)
	love.window.setTitle("Tic-tac-toe!")
	for i,v in ipairs(IMAGE_FILES) do
			img[v] = lg.newImage("data/"..v..".png")
	end

	tiles = {img.red, img.yellow}
	splash.enter()
end

function love.draw()
	gamestates[STATE].draw()
end

function love.mousepressed(x, y, button, istouch)
	gamestates[STATE].mousepressed(x, y)
end

function love.keypressed(key, scancode, isrepeat)
	gamestates[STATE].keypressed()
end