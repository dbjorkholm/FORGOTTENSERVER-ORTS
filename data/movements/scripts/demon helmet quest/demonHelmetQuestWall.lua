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
	if item.actionid == 980 then
		for i = 1, 2 do
			if not Tile(Position(pos[i])):getThing():Player(cid) then
				return true
			end
		end
		for i = 1, 3 do
			Tile(Position(wall[i])):getItemById(1050):remove()
			addEvent(Game.createItem, 10 * 60 * 1000, 1050, 1, wall[i])
		end
	end
	return true
end
