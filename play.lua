play = {}

fields =
{
	{1, 2, 1},
	{2, 1, 2},
	{1, 2, 1},
}
tileh=160
local height = tileh
borders =
{
	{{0,0},          {height,0},		 {height*2, 0},        {height*3, 0}},
	{{0, height},    {height, height},   {height*2, height},   {height*3, height}},
	{{0, height*2},  {height, height*2}, {height*2, height*2}, {height*3, height*2}},
	{{0, height*3},  {height, height*3}, {height*2, height*3}, {height*3, height*3}},
}

function play.enter(  )
	love.graphics.setColor({1, 1, 1, 1}) -- reset after splash
	done_fields =
	{
		{0, 0, 0},
		{0, 0, 0},
		{0, 0, 0},
	}
	objects = {}
	turn = 0 -- cross
	STATE = STATE_PLAY
end

function play.draw(  )
	for rowi=1, #fields do
		for coli=1, #fields[rowi] do
			local number = fields[rowi][coli]
			lg.draw(tiles[number], (rowi-1)*tileh, (coli-1)*tileh)
		end
	end

	for i, o in pairs(objects) do
		love.graphics.draw(o.item, o.x, o.y)
	end
end

function play.mousepressed(x, y)
	for rowi = 1, #borders-1 do
		for coli = 1, #borders[rowi]-1 do
			local less, more = borders[rowi][coli], borders[rowi+1][coli+1]
			local lessx, lessy = less[1], less[2]
			local morex, morey = more[1], more[2]
			if lessx <= x and lessy <= y and morex > x and morey > y then
				add_object(lessx, lessy, rowi, coli)
				local winner = check_win()
				if winner ~= 0 then
					win.enter(winner)
				end
			end
		end
	end
end

function play.keypressed(key, scancode, isrepeat)
	if key == "f" then
		name_choice.enter()
	end
end

function add_object(lessx, lessy, rowi, coli)
	if done_fields[rowi][coli] ~= 0 then
		print("Clicking the old field")
		return
	end

	local newObjId = #objects + 1
	local item = (turn % 2 == 0) and img.cross or img.round -- my god, ternary operator!
	objects[newObjId] = {x = lessx, y = lessy, item = item}
	turn = turn + 1
	done_fields[rowi][coli] = turn % 2 + 1 -- 1 is cross, 2 is round
end

function check_win()
	local winnum = 0
	local winner = 0
	for i=1,3 do
		if done_fields[i][1] ~= 0 and done_fields[i][1] == done_fields[i][2] and done_fields[i][2] == done_fields[i][3] then
			winner = done_fields[i][1]
		elseif done_fields[1][i] ~= 0 and done_fields[1][i] == done_fields[2][i] and done_fields[2][i] == done_fields[3][i] then
			winner = done_fields[1][i]
		end
	end
	if done_fields[1][1] ~= 0 and done_fields[1][1] == done_fields[2][2] and done_fields[2][2] == done_fields[3][3] then
		winner = done_fields[1][1]
	elseif done_fields[1][3] ~= 0 and done_fields[1][3] == done_fields[2][2] and done_fields[2][2] == done_fields[3][1] then
		winner = done_fields[1][3]
	end

	truce = true
	for i=1,3 do
		for j=1,3 do
			if done_fields[i][j] == 0 then
				truce = false
			end
		end
	end

	if truce then
		winner = 3
	end

	return winner
end