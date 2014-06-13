
function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if item.uid == 12129 then
		if player:getStorageValue(Storage.TheApeCity.Questline) >= 21 then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x = 32749, y = 32536, z = 10})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(lastPosition)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have access to this area.")
		end
	end
	return true
end


