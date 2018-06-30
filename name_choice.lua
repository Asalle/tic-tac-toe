require("hello")

name_choice = {}

function name_choice.enter()
	STATE = STATE_NAMECHOICE
end

function name_choice.draw()
	name_list = {"Kirill", "Tatiana", "Boris", "Alexey", "Natalia", "Victor", "Cezary"}
	print_color('Choose your name', fontSize, fontSize)
	love.graphics.print(':', 2, fontSize*(selection+1))
	for i = 1, #name_list do
		love.graphics.print(name_list[i], fontSize, fontSize*(i+1))
	end
end

function name_choice.keypressed(key, scancode, isrepeat)
	if key == "down" then
		selection = wrap(selection + 1, 1, #name_list)
	elseif key == "up" then
		selection = wrap(selection - 1, 1, #name_list)
	elseif key == "return" then
		name = name_list[selection]
		hello.enter()
	end


end

function name_choice.mousepressed(x, y, button, istouch)
end