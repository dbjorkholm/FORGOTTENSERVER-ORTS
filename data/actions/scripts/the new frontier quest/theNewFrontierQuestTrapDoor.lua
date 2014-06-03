function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 8008 then
	local player = Player(cid)
		if player:getStorageValue (1015) == 22 then
			player:teleportTo(toPosition, true)
			Item(item.uid):transform(item.itemid + 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end