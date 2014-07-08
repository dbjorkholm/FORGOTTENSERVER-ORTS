local pos = {
	{x = 33190, y = 31629, z = 13, stackpos = 255},
	{x = 33191, y = 31629, z = 13, stackpos = 255}
}

local wall = {
	{x = 33210, y = 31630, z = 13},
	{x = 33211, y = 31630, z = 13},
	{x = 33212, y = 31630, z = 13}
}

function onStepIn(cid, item, position, lastPosition)
	for i = 1, #pos do
		if not Tile(Position(pos[i])):getThing(Player(Cid)) then
			return true
		end
	end
	for i = 1, #wall do
		if Tile(Position(wall[i])):getItemById(1050) then
			Tile(Position(wall[i])):getItemById(1050):remove()
			addEvent(Game.createItem, 10 * 60 * 1000, 1050, 1, wall[i])
		end
	end
	return true
end
