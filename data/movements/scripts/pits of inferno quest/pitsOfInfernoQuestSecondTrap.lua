function removeStone(pos)
	return Tile(Position(pos.x, pos.y, pos.z)):getItemById(1285) and Tile(Position(pos.x, pos.y, pos.z)):getItemById(1285):remove(1) or true
end

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	player:teleportTo(Position(32826, 32273, 12))
	player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONAREA)
	Game.createItem(1285, 1, Position(fromPosition.x, fromPosition.y, fromPosition.z))
	addEvent(removeStone, 10 * 1000, fromPosition)
	return true
end
