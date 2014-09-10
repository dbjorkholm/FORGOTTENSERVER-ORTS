local teleports = {
	[3178] = {storage = 6, position = Position(33137, 31248, 6)},
	[3179] = {storage = 6, position = Position(33211, 31068, 9)},
	[3180] = {storage = 6, position = Position(33211, 31068, 9)},

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if player:getStorageValue(1060) >= teleports[item.uid].storage then
		player:teleportTo(teleports[item.uid].position)
		player:getPosition():sendMagicEffect(teleports[item.uid].position, CONST_ME_TELEPORT)
	else
		player:teleportTo(fromPosition)
	end
	return true
end
