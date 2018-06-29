win = {}

function win.enter(winner)
	STATE = STATE_WIN
	if winner == 1 then
		winner_name = 'rounds'
	elseif winner == 2 then
		winner_name = 'crosses'
	else
		winner_name = 'friendship'
	end
end

function win.draw(  )
	love.graphics.scale(3)
	love.graphics.print(winner_name..' won')
end

function win.keypressed(  )
	love.event.quit()
end