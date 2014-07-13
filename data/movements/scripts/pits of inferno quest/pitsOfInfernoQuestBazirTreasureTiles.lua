local config = {
	[] = Position(32745, 32394, 14),
	[] = Position(32745, 32394, 14)
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	local targetTile = config[item.actionid]
	if not targetTile then
		return true
	end
	
	player:teleportTo(targetTile)
	return true
end
