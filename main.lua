-- made by Asalle

require("win")
require("splash")

lg = love.graphics

STATE_SPLASH, STATE_INGAME, STATE_WIN = 0, 1, 2
STATE = STATE_SPLASH
gamestates = {[0]=splash, [1]=ingame, [2]=win}

IMAGE_FILES = {
"splash", "cross",  "round",  "splash",  "red",  "yellow"
}

img = {}

tileh=32
tileh=32

objects = {}
done_fields =
{
	{0, 0, 0},
	{0, 0, 0},
	{0, 0, 0},
}
turn = 0 -- cross
fields =
{
	{1, 2, 1},
	{2, 1, 2},
	{1, 2, 1},
}

local height = 5*tileh
borders =
{
	{{0,0},          {height,0},		 {height*2, 0},        {height*3, 0}},
	{{0, height},    {height, height},   {height*2, height},   {height*3, height}},
	{{0, height*2},  {height, height*2}, {height*2, height*2}, {height*3, height*2}},
	{{0, height*3},  {height, height*3}, {height*2, height*3}, {height*3, height*3}},
}

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
	-- lg.scale(5, 5)
	-- for rowi=1, #fields do
	-- 	for coli=1, #fields[rowi] do
	-- 		local number = fields[rowi][coli]
	-- 		lg.draw(tiles[number], (coli-1)*tileh, (rowi-1)*tileh)
	-- 	end
	-- end

	-- for i, o in pairs(objects) do
	-- 	love.graphics.draw(o.item, o.x, o.y)
	-- end
	gamestates[STATE].draw()
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
	print("id ", newObjId)
	print(rowi, coli)
end

function check_win()
	for i=1,3 do
		if done_fields[i][1] ~= 0 and done_fields[i][1] == done_fields[i][2] and done_fields[i][2] == done_fields[i][3] then
			return done_fields[i][1]
		elseif done_fields[1][i] ~= 0 and done_fields[1][i] == done_fields[2][i] and done_fields[2][i] == done_fields[3][i] then
			return done_fields[1][i]
		end
	end
	if done_fields[1][1] ~= 0 and done_fields[1][1] == done_fields[2][2] and done_fields[2][2] == done_fields[3][3] then
		return done_fields[1][1]
	elseif done_fields[1][3] ~= 0 and done_fields[1][3] == done_fields[2][2] and done_fields[2][2] == done_fields[3][1] then
		return done_fields[1][3]
	end
	return 0
end

function love.mousepressed(x, y, button, istouch)
	-- for rowi = 1, #borders-1 do
	-- 	for coli = 1, #borders[rowi]-1 do
	-- 		local less, more = borders[rowi][coli], borders[rowi+1][coli+1]
	-- 		local lessx, lessy = less[1], less[2]
	-- 		local morex, morey = more[1], more[2]
	-- 		if lessx <= x and lessy <= y and morex > x and morey > y then
	-- 			if lessx > 0 then
	-- 				lessx = lessx/5
	-- 			end
	-- 			if lessy > 0 then
	-- 				lessy = lessy/5
	-- 			end
	-- 			add_object(lessx, lessy, rowi, coli)
	-- 			local winner = check_win()
	-- 			if winner ~= 0 then
	-- 				win.enter(winner)
	-- 			end
	-- 		end
	-- 	end
	-- end
	gamestates[STATE].mousepressed()
end
