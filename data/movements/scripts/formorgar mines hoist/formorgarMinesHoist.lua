function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return false
	end

	local loc1 = Position(32157, 31125, 9)
	local loc2 = Position(32157, 31125, 10)
	local loc3 = Position(32157, 31125, 11)

	if player:getStorageValue(470) == 1 and player:getStorageValue(471) == 1 then
		if item.uid == 3059 then
			player:teleportTo(loc2)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		elseif item.uid == 3060 then
			if Tile(Position(32156, 31125, 10)):getItemById(1945) > 0 then
				player:teleportTo(loc3)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			else
				player:teleportTo(loc1)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			end
		elseif item.uid == 3061 then
			player:teleportTo(loc2)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	else
		player:teleportTo(lastPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must first find the hoist instruction before using it.")
	end
	return true
end
