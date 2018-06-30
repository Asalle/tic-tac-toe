win = {}

WIN_MSG = {"play again?", "yes", "no"}
selection = 1 -- yes

function wrap(value, min, max)
	if value < min then
		return min
	elseif value > max then
		return max
	else
		return value
	end
end

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
	print_color(winner_name..' won', fontSize, fontSize)
	love.graphics.print(':', 2, fontSize*(selection+2))
	for i = 1, #WIN_MSG do
		love.graphics.print(WIN_MSG[i], fontSize, fontSize*(i+1))
	end
end

function win.keypressed(key, scancode, isrepeat)
	if key == "down" then
		selection = wrap(selection + 1, 1, 2)
	elseif key == "up" then
		selection = wrap(selection - 1, 1, 2)
	elseif key == "return" then
		print("selection", selection)
		if selection == 1 then
			play.enter()
		else
			love.event.quit()
		end
	end


end

function win.mousepressed(x, y, button, istouch)
end