-- made by Asalle

lg = love.graphics

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
turn = 0 -- round
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
    local IMAGE_FILES = {
	"splash", "cross",  "round",  "splash",  "red",  "yellow"
	}
	for i,v in ipairs(IMAGE_FILES) do
			img[v] = lg.newImage("data/"..v..".png")
	end

	tiles = {img.red, img.yellow}
end

function love.draw()
	lg.scale(5, 5)
	for rowi=1, #fields do
		for coli=1, #fields[rowi] do
			local number = fields[rowi][coli]
			lg.draw(tiles[number], (coli-1)*tileh, (rowi-1)*tileh)
		end
	end

	for i, o in pairs(objects) do
		love.graphics.draw(o.item, o.x, o.y)
	end
end

function add_object(lessx, lessy, rowi, coli)
	if done_fields[rowi][coli] == 1 then
		print("Clicking the old field")
		return
	end

	local newObjId = #objects + 1
	local item = (turn % 2 == 0) and img.cross or img.round -- my god, ternary operator!
	objects[newObjId] = {x = lessx, y = lessy, item = item}
	turn = turn + 1
	done_fields[rowi][coli] = 1
	print("id ", newObjId)
	print(rowi, coli)
end

function love.mousepressed(x, y, button, istouch)
	for rowi = 1, #borders-1 do
		for coli = 1, #borders[rowi]-1 do
			local less, more = borders[rowi][coli], borders[rowi+1][coli+1]
			local lessx, lessy = less[1], less[2]
			local morex, morey = more[1], more[2]
			if lessx <= x and lessy <= y and morex > x and morey > y then
				if lessx > 0 then
					lessx = lessx/5
				end
				if lessy > 0 then
					lessy = lessy/5
				end
				add_object(lessx, lessy, rowi, coli)
				return
			end
		end
	end
end
