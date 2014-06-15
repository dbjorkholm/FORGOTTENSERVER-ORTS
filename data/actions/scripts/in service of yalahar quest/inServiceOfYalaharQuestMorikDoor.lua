function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3083) then
		local player = Player(cid)
		if(player:getStorageValue(Storage.InServiceofYalahar.Questline) >= 31) then
			if(item.itemid == 6259) then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			end
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end