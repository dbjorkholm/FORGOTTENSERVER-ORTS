function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(2216) < 1 then
		if item.itemid == 5114 then
			Creature(cid):teleportTo(toPosition, true)
			Item(item.uid):transform(5115)
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	end
	return true
end
