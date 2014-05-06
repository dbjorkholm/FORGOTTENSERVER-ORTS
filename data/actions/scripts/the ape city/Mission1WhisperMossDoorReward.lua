function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 12121 then
	local player = Player(cid)
		if item.itemid == 3551 then --door
			if player:getStorageValue (12120) > 0 then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
			end
		elseif item.itemid == 1738 then --chest reward
			if player:getStorageValue(12121) == 1 then
				player:setStorageValue(12121, 2)  -- The Ape City Questlog - Mission 1: Whisper Moss
				player:addItem(4838, 1)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a Whisper Moss.")
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
			end
		end
	end
	return true
end
