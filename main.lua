-- made by Asalle

lg = love.graphics

img = {}
game = {}

tilew=32
tileh=32
allw, allh = tilew*3, tileh*3

function love.load()
    local IMAGE_FILES = {
	"splash", "cross",  "round",  "splash",  "red",  "yellow"
	}

	for i,v in ipairs(IMAGE_FILES) do
			img[v] = lg.newImage("data/"..v..".png")
	end

	quad = {}	-- global Quads
	quad.red = lg.newQuad(0, 0, tilew, tileh, img.red:getDimensions())
	quad.yellow = lg.newQuad(0, 0, tilew, tileh, img.yellow:getDimensions())
	tiles = {img.red, img.yellow}
end

function love.draw()
	fields = 
	{
		{1, 2, 1},
		{2, 1, 2},
		{1, 2, 1},
	}

	for rowi=1, #fields do
		local row = fields[rowi]
		for coli=1, #row do
			local number = row[coli]
			lg.draw(tiles[number], (coli-1)*tilew, (rowi-1)*tileh)
		end
	end
end
