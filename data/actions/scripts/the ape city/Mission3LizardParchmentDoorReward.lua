function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
		if item.itemid == 3551 and item.actionid == 12123 then --door
			if player:getStorageValue (12120) > 7 then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
			end
		elseif item.itemid == 1741 and item.uid == 12123 then --chest reward
			if player:getStorageValue(12123) == 1 then
				player:setStorageValue(12123, 2) -- The Ape City Questlog - Mission 3: Lizard Parchment
				player:addItem(5956, 1)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found an old parchment.")
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
			end
		end
	return true
end
