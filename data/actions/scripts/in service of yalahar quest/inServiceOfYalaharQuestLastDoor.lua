function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(player:getStorageValue(Storage.InServiceofYalahar.Questline) >= 51 and item.itemid == 1257) then
		if(item.itemid == 1258) then 
			return false 
		end
		Creature(cid):teleportTo(toPosition, true)
		Item(item.uid):transform(1258)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	end
return true
end
