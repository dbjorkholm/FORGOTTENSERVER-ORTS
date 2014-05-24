function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return false
	end
	player:setStorageValue(50021, 1)
	player:teleportTo({x = 32269, y = 31853, z = 15}, false)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end