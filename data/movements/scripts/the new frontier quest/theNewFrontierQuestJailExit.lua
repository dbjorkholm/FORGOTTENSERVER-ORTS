
function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	if player:getStorageValue(Storage.TheNewFrontier.Mission08) >= 1 then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo({x = 33145, y = 31247, z = 6})
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have access to this area.")
	end
	return true
end


