function onStepIn(cid, item, position, lastPosition)
	if item.uid == 12129 then
	local player = Player(cid)
		if player:getStorageValue(12120) >= 21 then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x = 32749, y = 32536, z = 10})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x = 32838, y = 32532, z = 9})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have access to this area.")
		end
	end
	return true
end


