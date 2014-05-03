function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3079) then
		local player = Player(cid)
		if(player:getStorageValue(25) == 1 and player:getStorageValue(24) == 1 and player:getStorageValue(23) == 1) then
			if(item.itemid == 1257) then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			end
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end