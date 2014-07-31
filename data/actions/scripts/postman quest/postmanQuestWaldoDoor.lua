function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)

	if player:getStorageValue(Storage.postman.Mission08) >= 1 then
		if item.itemid == 5114 then
			player:teleportTo(toPosition, true)
			Item(item.uid):transform(item.itemid + 1)
		end
	end
	return true
end
