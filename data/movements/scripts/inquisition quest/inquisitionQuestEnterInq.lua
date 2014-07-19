function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

		if player:getStorageValue(Storage.TheInquisition.Questline) >= 20 then
			local destination = Position(33168, 31683, 15)
			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(fromPosition)
			fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have access to this area.")
		end
	return true
end

