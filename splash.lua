splash = {}

lg = love.graphics

motto = {"say hello", "to the", "tic tac", "toe"}

function splash.enter(  )
	STATE = STATE_SPLASH
end

function splash.draw(  )
	for i, word in ipairs(motto) do
		print_color(word, fontSize, fontSize*i)
	end
end

function splash.mousepressed(  )
	play.enter()
end

function splash.keypressed()
	play.enter()
end