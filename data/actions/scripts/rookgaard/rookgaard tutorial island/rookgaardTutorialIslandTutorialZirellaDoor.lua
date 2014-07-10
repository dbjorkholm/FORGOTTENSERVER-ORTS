function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player= Player(cid)
	if player:getStorageValue(Storage.RookgaardTutorialIsland.ZirellaNpcGreetStorage) > 7 then
		Item(item.uid):transform(item.itemid + 1)
		player:teleportTo(toPosition, true)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
	end
	return true
end