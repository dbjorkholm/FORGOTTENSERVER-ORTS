function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player= Player(cid)
	if item.itemid == 6898 then
		if player:getStorageValue(Storage.RookgaardTutorialIsland.ZirellaNpcGreetStorage) > 7 then
			Item(item.uid):transform(item.itemid + 1)
			player:teleportTo(toPosition, true)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end