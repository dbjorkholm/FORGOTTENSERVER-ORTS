local positions = {
	Position(33385, 31139, 8),
	Position(33385, 31134, 8),
	Position(33385, 31126, 8),
	Position(33385, 31119, 8),
	Position(33385, 31118, 8),
	Position(33380, 31085, 8),
	Position(33380, 31093, 8)
}

function onThink(interval, lastExecution)
	if math.random(100) < 50 then
		return true
	end

	local tile
	for i = 1, #positions do
		tile = Tile(positions[i]):getItemById(12214)
		if tile then
			tile:transform(12213)
		else
			tile:transform(12214)
		end
	end

	return true
end