function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 8553 and item.actionid == 12134 then --door
		local player = Player(cid)
		if player:getStorageValue (12134) > 0 then
			player:teleportTo(toPosition, true)
			Item(item.uid):transform(item.itemid + 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end