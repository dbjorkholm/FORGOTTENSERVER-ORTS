function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(Storage.AnnihilatorDone) ~= 1 then
		if item.itemid == 5114 then
			player:teleportTo(toPosition, true)
			Item(item.uid):transform(item.itemid + 1)
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
	end
	return true
end