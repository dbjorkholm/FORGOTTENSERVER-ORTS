local pos = {
	{x = 33190, y = 31629, z = 13, stackpos = 255},
	{x = 33191, y = 31629, z = 13, stackpos = 255}
}

local wall = {
	{x = 33210, y = 31630, z = 13},
	{x = 33211, y = 31630, z = 13},
	{x = 33212, y = 31630, z = 13}
}

function onStepIn(cid, item, position, fromPosition)
	for i = 1, #pos do
		local creature = Tile(Position(pos[i])):getTopCreature()
		if not creature or not creature:isPlayer() then
			return true
		end
	end
	
	for i = 1, #wall do
		local tile = Tile(Position(wall[i]))
		if tile:getItemById(1050) then
			tile:getItemById(1050):remove()
			addEvent(Game.createItem, 5 * 60 * 1000, 1050, 1, wall[i])
		end
	end
	return true
end
