splash = {}

lg = love.graphics

function splash.enter(  )
	STATE = STATE_SPLASH
end

function splash.draw(  )
	-- love.window.setMode(480, 480)
	splash_img = img.splash
	lg.draw(splash_img, 0, 0)
end

function splash.mousepressed(  )
	print("Moving on to the actual game")
end