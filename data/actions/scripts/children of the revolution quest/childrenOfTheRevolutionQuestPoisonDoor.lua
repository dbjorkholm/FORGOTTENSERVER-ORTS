function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3165) then
		local player = Player(cid)
		if player:getStorageValue(Storage.ChildrenoftheRevolution.Questline) >= 9 then
			if(item.itemid == 10791) then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			end
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end