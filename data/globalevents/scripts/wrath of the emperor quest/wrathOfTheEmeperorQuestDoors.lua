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
	for i = 1, 5 do
		if math.random(2) == 1 then
			local tile = Tile(positions[i])
			if tile:getItemById(12214) then
				tile:getItemById(12214):transform(12213)
			else
				tile:getItemById(12213):transform(12214)
			end
		end
	end
	return true
end