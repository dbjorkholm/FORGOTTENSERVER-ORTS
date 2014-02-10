function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(Player(cid):getStorageValue(30) >= 51 and item.itemid == 1257) then
		if(item.itemid == 1258) then 
			return false 
		end
		Creature(uid):teleportTo(toPosition, true)
		Item(item.uid):transform(1258)
	else
		Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	end
return true
end
