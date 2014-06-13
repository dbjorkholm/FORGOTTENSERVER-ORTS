function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if(item.uid == 9014) then
		if (player:getStorageValue(Storage.TheInquisition.Questline) >= 20) then
			local destination = Position({x = 33168, y = 31683, z = 15})
			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(lastPosition)
			lastPosition:sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have access to this area.")
		end
	end
	return true
end
