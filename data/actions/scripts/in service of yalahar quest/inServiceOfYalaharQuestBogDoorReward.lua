function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3079) then
		local player = Player(cid)
		if(player:getStorageValue(Storage.InServiceofYalahar.DiseasedDan) == 1 and player:getStorageValue(Storage.InServiceofYalahar.DiseasedBill) == 1 and player:getStorageValue(Storage.InServiceofYalahar.DiseasedFred) == 1) then
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