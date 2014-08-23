function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		player:teleportTo(fromPosition)
		return true
	end

	if player:getStorageValue(Storage.WrathoftheEmperor.Mission09) == -1 then
		player:teleportTo(fromPosition)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	local sleepingdragon = Position(33240, 31247, 10)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo(sleepingdragon)
	sleepingdragon:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
