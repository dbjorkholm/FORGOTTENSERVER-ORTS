function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return false
	end
	if player:getStorageValue(50015) < 1 then
		player:setStorageValue(50015, 1)
		player:teleportTo({x = 32268, y = 31856, z = 15}, false)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo({x = 32185, y = 31939, z = 14}, false)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
