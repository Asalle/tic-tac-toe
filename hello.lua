hello = {}

function hello.enter()
	STATE = STATE_HELLO
end

function hello.draw()
	local name_to_hello_map = {["Kirill"]={"Please tell", "Tania,", "that the AI", "will prevail!", "press any", "button"},
							   ["Tatiana"]={"THE AI", "WILL", "PREVAIL!!!", "", "press any", "button"},
							   ["Boris"]={"All hail the", "technocratic", "brotherhood!", "", "press any", "button"},
							   ["Alexey"]={"Lucifer means", "Lightbringer", "", "press any", "button"},
							   ["Natalia"]={"Escape rooms are", "simulations", "of life.", "- said I writing", "a game."},
							   ["Victor"]={"Why are all", "Victors", "so nice?", "", "press any", "button"},
							   ["Cezary"]={"你要什么?", "", "press any", "button"}}
	for i = 1, #name_to_hello_map[name] do
		print_color(name_to_hello_map[name][i], fontSize, fontSize*(i+1))
	end
end

function hello.keypressed(key, scancode, isrepeat)
	love.event.quit()
end

function hello.mousepressed(x, y, button, istouch)
end