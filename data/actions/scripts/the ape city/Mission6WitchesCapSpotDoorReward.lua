function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 12126 then
	local player = Player(cid)
		if item.itemid == 1223 then --door
			if player:getStorageValue (12120) > 13 then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
			end
		elseif item.itemid == 4183 then --reward
			if player:getStorageValue(12126) == 1 then
				player:setStorageValue(12126, 2) -- The Ape City Questlog - Mission 6: Witches' Cap Spot
				player:addItem(4840, 1)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a Witches Cap Spot.")
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
			end
		end
	end
	return true
end
