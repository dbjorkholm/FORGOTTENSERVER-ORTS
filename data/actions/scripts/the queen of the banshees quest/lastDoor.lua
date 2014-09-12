function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 5114 then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.QueenOfBansheesQuest.Kiss) == 1 and player:getStorageValue(Storage.QueenOfBansheesQuest.LastSeal) < 1 then
		player:teleportTo(toPosition, true)
		Item(item.uid):transform(item.itemid + 1)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The door seems to be sealed against unwanted intruders.')
	end
	return true
end
