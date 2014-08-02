function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.uid == 3115 then
		if Player(cid):getStorageValue(Storage.postman.Mission05) >= 1  then
			if item.itemid == 1225 then
				Player(cid):teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			end
		end
	end
	return true
end
