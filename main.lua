-- made by Asalle

require("win")
require("play")
require("splash")
local lovetest = require "test/lovetest"

function init_game()
	lg = love.graphics

	STATE_SPLASH, STATE_PLAY, STATE_WIN = 0, 1, 2
	gamestates = {[0]=splash, [1]=play, [2]=win}

	IMAGE_FILES = {
	"splash", "cross",  "round", "red",  "yellow"
	}

	img = {}
end

function print_color(text, x, y)
	local scaleFactor = 1
	love.graphics.setColor(font_color)
	love.graphics.print(text, x, y, 0, scaleFactor, scaleFactor)
end

function love.load(arg)
	if lovetest.detect(arg) then
		lovetest.run()
	end

	init_game()
	love.window.setMode(480, 480)
	love.window.setTitle("Tic-tac-toe!")
	for i,v in ipairs(IMAGE_FILES) do
			img[v] = lg.newImage("data/"..v..".png")
	end

	fontSize = 50
	font = love.graphics.newFont("data/heav.ttf", fontSize)
	love.graphics.setFont(font)
	font_color = {1, 0.5, 0.55, 1}

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
	gamestates[STATE].keypressed(key, scancode, isrepeat)
end