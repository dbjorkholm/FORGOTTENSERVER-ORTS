function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return false
	end
	if player:getStorageValue(50019) < 1 then
		player:setStorageValue(50019, 1)
		player:teleportTo({x = 32272, y = 31849, z = 15}, false)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo(lastPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end