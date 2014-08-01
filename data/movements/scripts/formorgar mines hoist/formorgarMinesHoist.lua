function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return false
	end

	if player:getStorageValue(470) == 1 and player:getStorageValue(471) == 1 then
		if isInArray({3059, 3061}, item.uid) then
			player:teleportTo(Position(32157, 31125, 10))
		elseif item.uid == 3060 then
			if Tile(Position(32156, 31125, 10)):getItemById(1945) then
				player:teleportTo(Position(32157, 31125, 11))
			else
				player:teleportTo(Position(32157, 31125, 9))
			end
		end
	else
		player:teleportTo(fromPosition)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You must first find the hoist instruction before using it.')
	end
	
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
