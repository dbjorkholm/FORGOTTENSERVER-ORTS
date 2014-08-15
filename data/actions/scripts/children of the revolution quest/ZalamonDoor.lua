function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(Storage.TheNewFrontier.Mission08) >= 2 then
		if item.itemid == 10791 then
			player:teleportTo(toPosition, true)
			Item(item.uid):transform(item.itemid + 1)
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
	end
	return true
end