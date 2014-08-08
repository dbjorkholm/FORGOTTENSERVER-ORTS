function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if player:getStorageValue(3057) ~= 1 or player:getStorageValue(3058) ~= 1 then
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You must first find the hoist instruction before using it.')
		return true
	end

	if isInArray({3059, 3061}, item.uid) then
		player:teleportTo(Position(32157, 31125, 10))
	elseif item.uid == 3060 then
		if Tile(Position(32156, 31125, 10)):getItemById(1945) then
			player:teleportTo(Position(32157, 31125, 11))
		else
			player:teleportTo(Position(32157, 31125, 9))
		end
	end

	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
