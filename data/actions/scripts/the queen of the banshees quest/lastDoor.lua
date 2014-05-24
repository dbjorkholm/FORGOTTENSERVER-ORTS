function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(50020) and player:getStorageValue(50021) < 1 then
		if item.itemid == 5114 then
			Item(item.uid):transform(item.itemid + 1)
			player:teleportTo(toPosition, true)
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
	end		
	return true
end
