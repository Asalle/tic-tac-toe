win = {}

function win.enter(winner)
	STATE = STATE_WIN
	winner_name = (winner == 2) and 'crosses' or 'rounds'
end

function win.draw(  )
	love.graphics.scale(3)
	love.graphics.print(winner_name..' won')
end

function win.keypressed(  )
	love.event.quit()
end