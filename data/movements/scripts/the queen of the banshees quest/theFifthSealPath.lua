function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return false
	end
	if item.actionid == 50014 then
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	else
		player:teleportTo({x = 32185, y = 31939, z = 14}, false)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end		
	return true
end
