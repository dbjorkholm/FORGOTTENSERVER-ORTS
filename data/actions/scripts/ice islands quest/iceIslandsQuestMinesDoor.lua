function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if item.uid == 7813 then
		if player:getStorageValue (12001) >= 35 then
			if item.itemid == 7040 then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			end
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end

