local config = {
	[50082] = Position(32745, 32394, 14),
	[50083] = Position(32745, 32394, 14)
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	local targetPosition = config[item.actionid]
	if not targetPosition then
		return true
	end
	
	player:teleportTo(targetPosition)
	return true
end
