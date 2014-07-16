function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if item.actionid == 8816 then
		if player:getStorageValue(8816) ~= 1 then
			player:setStorageValue(8816, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You discovered a shortcut to the pits of inferno.")
		end
	else
		if player:getStorageValue(8817) ~= 1 then
			player:setStorageValue(8817, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You discovered a shortcut to the pits of inferno.")
		end
	end
return true
end
